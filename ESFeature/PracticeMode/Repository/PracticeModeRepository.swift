import Combine
import UIKit
import Foundation
import ESDataSource
import ESDataModel
import FirebaseRemoteConfig
import ESAppPurchased
import ESUSCDataRepository

@MainActor
public final class PracticeModeRepository: PracticeModeDataSource {
    private let userDefault = UserDefaults.standard
    private let remote = RemoteConfig.remoteConfig()
    
    public var showStatePickerPublisher: AnyPublisher<Bool, Never> {
        showStatePickerSubject.eraseToAnyPublisher()
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
            .publisher(for: \.currentPracticeState)
            .map { rawValue in
                DataState.USState(rawValue: rawValue)
            }
            .eraseToAnyPublisher()
    }
    
    private var currentOfficersSnapShot: DataModel.USStateOfficers? = nil
    private var allQuestionsSubject: [DataModel.PracticeQuestion] = []
    private var practiceQuestionsSubject = CurrentValueSubject<[DataModel.PracticeQuestion], Never>([])
    private var currentPracticeStateSubject = CurrentValueSubject<DataState.USState, Never>(.CA) // Assuming .CA is default
    private var currentScoreSubject = CurrentValueSubject<Int, Never>(0)
    private var currentQuestionIndexSubject = CurrentValueSubject<Int, Never>(0)
    private var showStatePickerSubject = CurrentValueSubject<Bool, Never>(false)
    private var uscDataRepository: USCDataRepository
    
    private var cancellables = Set<AnyCancellable>()
    
    public init(uscDataRepository: USCDataRepository) {
        self.uscDataRepository = uscDataRepository
        let initialAreaRawValue = userDefault.string(forKey: "practice_area")
        uscDataRepository.currentOfficersPublisher.sink { [weak self] in
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
    
    // MARK: All data from remote config. Will remove this later
    public func checkAnswerOnline(_ answer: String) {
        let activeTestQuestions = self.practiceQuestionsSubject.value
        let currentIndex = self.currentQuestionIndexSubject.value
        
        guard currentIndex >= 0 && currentIndex < activeTestQuestions.count else { return }
        let currentQuestion = activeTestQuestions[currentIndex]
        
        switch currentQuestion.questionType {
        case let .onlineCheck(question, correctAnswers):
            var isCorrect: Bool = correctAnswers.contains(where: {
                $0.lowercased() == answer.lowercased()
            })
            
            if question == "Name your U.S. Representative" {
                //MARK: Need to have data for this
                isCorrect = true
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
        userDefault.currentPracticeState = state.rawValue
        currentPracticeStateSubject.send(state)
        showStatePickerSubject.send(false)
    }
    
    public func showStatePicker(_ isShowed: Bool) {
        showStatePickerSubject.send(isShowed)
    }
    
    public func loadTestQuestions() {
        uscDataRepository.uscis100QuestionsPublisher.sink { questions in
            let practiceQuestions: [DataModel.PracticeQuestion] = questions.map {
                .init(questionInput: $0)
            }
            self.allQuestionsSubject = practiceQuestions
            self.loadRandomQuestions()
        }
        .store(in: &cancellables)
    }
    
    public func loadRandomQuestions(count: Int = 10) {
        practiceQuestionsSubject.send(
            Array(allQuestionsSubject.shuffled().prefix(count))
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
