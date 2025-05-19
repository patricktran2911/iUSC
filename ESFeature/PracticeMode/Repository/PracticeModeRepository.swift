import Combine
import UIKit
import Foundation
import ESDataSource
import ESDataModel
import FirebaseRemoteConfig
import ESAppPurchased

@MainActor
public final class PracticeModeRepository: PracticeModeDataSource {
    private let userDefault = UserDefaults.standard
    private let remote = RemoteConfig.remoteConfig()
    
    public var showStatePickerPublisher: AnyPublisher<Bool, Never> {
        showStatePickerSubject.eraseToAnyPublisher()
    }
    
    public var currentUSStateOfficersPublisher: AnyPublisher<DataModel.USStateOfficers?, Never> {
        currentPracticeStateSubject.map { state in
            var usStateOfficers: DataModel.USStateOfficers
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let president = try self.remote["president"].decoded(asType: DataModel.USStateOfficers.USOfficer.self)
                let vicePresident = try self.remote["vice_president"].decoded(asType: DataModel.USStateOfficers.USOfficer.self)
                let chiefJustice = try self.remote["chief_justice"].decoded(asType: DataModel.USStateOfficers.USOfficer.self)
                let speakerOfTheHouse = try self.remote["speaker_of_the_house"].decoded(asType: DataModel.USStateOfficers.USOfficer.self)
                let stateOfficers = try self.remote[state.rawValue].decoded(asType: DataModel.USStateOfficers.USStateOfficers.self)
                usStateOfficers = .init(
                    president: president,
                    vicePresident: vicePresident,
                    chiefJustice: chiefJustice,
                    speakerOfTheHouse: speakerOfTheHouse,
                    stateOfficers: stateOfficers
                )
            } catch {
                print(error.localizedDescription)
                return nil
            }
            return usStateOfficers
        }
        .eraseToAnyPublisher()
    }
    
    public var testQuestionsPublisher: AnyPublisher<[DataModel.PracticeQuestion], Never> {
        practiceQuestionsSubject.eraseToAnyPublisher()

    }
    
    public var practiceScorePublisher: AnyPublisher<Int, Never> {
        currentScoreSubject.eraseToAnyPublisher()
    }
    
    public var currentQuestionPublisher: AnyPublisher<DataModel.PracticeQuestion?, Never> {
        testQuestionsPublisher.combineLatest(currentQuestionIndexSubject).map { questions, index in
            guard index >= 0 && index < questions.count else {
                return nil
            }
            return questions[index]
        }
        .eraseToAnyPublisher()
    }
    
    public var testStatePublisher: AnyPublisher<DataState.TestState, Never> {
        testQuestionsPublisher.combineLatest(currentQuestionIndexSubject).map { questions, index in
            if index >= questions.count {
                return .complete
            } else {
                return .inProgress
            }
        }
        .eraseToAnyPublisher()
    }
    
    public var currentAreaTestPublisher: AnyPublisher<DataState.USState?, Never> {
        userDefault
            .publisher(for: \.practice_area)
            .map { rawValue in
                DataState.USState(rawValue: rawValue)
            }
            .eraseToAnyPublisher()
    }
    
    private var currentOfficersSnapShot: DataModel.USStateOfficers? = nil
    private var allQuestionsSubject = CurrentValueSubject<[DataModel.PracticeQuestion],Never>([])
    private var practiceQuestionsSubject = CurrentValueSubject<[DataModel.PracticeQuestion], Never>([])
    private var currentPracticeStateSubject = CurrentValueSubject<DataState.USState, Never>(.CA) // Assuming .CA is default
    private var currentScoreSubject = CurrentValueSubject<Int, Never>(0)
    private var currentQuestionIndexSubject = CurrentValueSubject<Int, Never>(-1)
    private var showStatePickerSubject = CurrentValueSubject<Bool, Never>(false)
    
    private var cancellables = Set<AnyCancellable>()
    
    public init() {
        let initialAreaRawValue = userDefault.string(forKey: "practice_area")
        currentUSStateOfficersPublisher.sink { [weak self] in
            guard let self = self else {
                return
            }
            currentOfficersSnapShot = $0
        }
        .store(in: &cancellables)
        
        if let initialAreaRawValue, let initialArea = DataState.USState(rawValue: initialAreaRawValue) {
            if initialArea != currentPracticeStateSubject.value {
                currentPracticeStateSubject.send(initialArea)
            }
        } else {
            showStatePickerSubject.send(true)
        }
        loadTestQuestions()
    }
    
    public func checkAnswer(_ indexes: [Int]) {
        let activeTestQuestions = self.practiceQuestionsSubject.value
        let currentIndex = self.currentQuestionIndexSubject.value
        
        guard currentIndex >= 0 && currentIndex < activeTestQuestions.count else { return }
        let currentQuestion = activeTestQuestions[currentIndex]
        
        let currentQuestionCorrectAnswersIndexes: [Int] = {
            switch currentQuestion.questionType {
            case let .single(_, options, answer):
                let correctAnswerIndex = options.firstIndex(of: answer)
                return [correctAnswerIndex ?? 0]
            case let .multiple(_, options, answers, _):
                let correctAnswerIndexes = answers.compactMap { options.firstIndex(of: $0) }
                return correctAnswerIndexes
            case .onlineCheck:
                return []
            }
        }()
        
        let selectedSet = Set(indexes)
        let correctSet = Set(currentQuestionCorrectAnswersIndexes)
        
        let isCorrect: Bool = {
            switch currentQuestion.questionType {
            case let .multiple(_, _, _, answerQuantity):
                return selectedSet.isSubset(of: correctSet) && selectedSet.count >= (answerQuantity ?? 1) && selectedSet.count <= correctSet.count
            default :
                return selectedSet == correctSet
            }
        }()
        
        if isCorrect {
            currentScoreSubject.send(currentScoreSubject.value + 1)
        }
        currentQuestionIndexSubject.send(currentQuestionIndexSubject.value + 1)
    }
    
    public func checkAnswerOnline(_ answer: String) {
        let activeTestQuestions = self.practiceQuestionsSubject.value
        let currentIndex = self.currentQuestionIndexSubject.value
        
        guard currentIndex >= 0 && currentIndex < activeTestQuestions.count else { return }
        let currentQuestion = activeTestQuestions[currentIndex]
        
        switch currentQuestion.questionType {
        case let .onlineCheck(question, _):
            guard let usOfficers = currentOfficersSnapShot else {
                print("[BOGUS]: No US Officers Snapshot")
                return
            }
            var isCorrect: Bool = false
            if question == "Who is one of your state U.S. Senators now?" {
                isCorrect = usOfficers.stateOfficers.senators.contains {
                    $0.lowercased() == answer.lowercased()
                }
            } else if question == "What is the capital of your state?" {
                isCorrect = usOfficers.stateOfficers.capital.lowercased() == answer.lowercased()
            } else if question == "Name your U.S. Representative" {
                //MARK: Need to have data for this
                isCorrect = true
            } else if question == "Who is the Governor of your state now?" {
                isCorrect = usOfficers.stateOfficers.governor.lowercased() == answer.lowercased()
            } else if question == "What is the name of the Speaker of the House of Representatives now?" {
                isCorrect = usOfficers.speakerOfTheHouse.names.contains {
                    $0.lowercased() == answer.lowercased()
                }
            } else if question == "What is the name of the President of the United States now?" {
                isCorrect = usOfficers.president.names.contains {
                    $0.lowercased() == answer.lowercased()
                }
            } else if question == "What is the name of the Vice President of the United States now?" {
                isCorrect = usOfficers.vicePresident.names.contains {
                    $0.lowercased() == answer.lowercased()
                }
            } else if question == "Who is the Chief Justice of the United States now?" {
                isCorrect = usOfficers.chiefJustice.names.contains {
                    $0.lowercased() == answer.lowercased()
                }
            } else if question == "Who is the Father of Our Country?" {
                isCorrect = answer.lowercased() == "george washington"
            } else if question == "Who was the first President?" {
                isCorrect = answer.lowercased() == "george washington"
            } else if question == "Who was President during World War I?" {
                isCorrect = answer.lowercased() == "woodrow wilson"
            } else if question == "Who was President during the Great Depression and World War II?" {
                isCorrect = answer.lowercased() == "franklin roosevelt"
            }
            
            if isCorrect {
                currentScoreSubject.send(currentScoreSubject.value + 1)
            }
            
        default:
            print("[PracticeModeRepository] Warning: checkAnswerOnline called for non-onlineCheck question type.")
            break
        }
        currentQuestionIndexSubject.send(currentQuestionIndexSubject.value + 1)
    }
    
    public func updateTestState(_ state: DataState.USState) {
        userDefault.set(state.rawValue, forKey: "practice_area")
        currentPracticeStateSubject.send(state)
        showStatePickerSubject.send(false)
    }
    
    public func showStatePicker(_ isShowed: Bool) {
        showStatePickerSubject.send(isShowed)
    }
    
    public func loadTestQuestions() {
        [DataModel.QuestionDecoded].dataPublisher().sink { questions in
            let practiceQuestions: [DataModel.PracticeQuestion] = questions.map {
                .init(questionInput: $0)
            }
            self.allQuestionsSubject.value = practiceQuestions
            self.loadRandomQuestions()
        }
        .store(in: &cancellables)
    }
    
    public func loadRandomQuestions(count: Int = 10) {
        practiceQuestionsSubject.send(
            Array(allQuestionsSubject.value.shuffled().prefix(count))
        )
        currentQuestionIndexSubject.send(0)
        currentScoreSubject.send(0)
    }
}

fileprivate extension DataModel.PracticeQuestion {
    init(questionInput: DataModel.QuestionDecoded) {
        self.init(
            questionType: .from(questionInput)
        )
    }
}

private extension DataModel.PracticeQuestion.QuestionType {
    static func from(_ question: DataModel.QuestionDecoded) -> Self {
        switch question.answerType {
        case .single, .interchange:
            let correct = question.correctAnswers.randomElement() ?? ""
            var optionsSet = Set(question.wrongAnswers.shuffled().prefix(3))
            optionsSet.insert(correct)
            let options = Array(optionsSet).shuffled()
            
            return .single(
                question: question.question,
                options: options,
                correctAnswer: correct
            )
            
        case .multiple:
            let correctAnswersShuffled = question.correctAnswers.shuffled()
            let numCorrectToDisplay = question.answerQuantity ?? 1
            let selectedCorrectAnswers = Array(correctAnswersShuffled.prefix(numCorrectToDisplay))
            
            let numWrongToDisplay = max(0, 4 - selectedCorrectAnswers.count)
            let selectedWrongAnswers = Array(question.wrongAnswers.shuffled().prefix(numWrongToDisplay))
            
            let allOptions = (selectedCorrectAnswers + selectedWrongAnswers).shuffled()
            
            return .multiple(
                question: question.question,
                options: allOptions,
                correctAnswer: question.correctAnswers,
                answerQuantity: question.answerQuantity
            )
            
        case .stateAnswer, .peopleAnswer:
            return .onlineCheck(question: question.question, correctAnswers: question.correctAnswers)
        }
    }
}

extension UserDefaults {
    @objc
    dynamic var practice_area: String {
        return string(forKey: "practice_area") ?? DataState.USState.CA.rawValue
    }
}
