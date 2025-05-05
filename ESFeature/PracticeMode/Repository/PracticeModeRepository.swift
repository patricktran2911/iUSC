import Combine
import UIKit
import Foundation
import ESDataSource
import ESDataModel

struct Question: Decodable {
    enum AnswerType: String, Decodable {
        case single = "singleAnswer"
        case multiple = "multipleAnswer"
        case interchange = "interchangeAnswer"
        case stateAnswer = "stateAnswer"
        case peopleAnswer = "peopleAnswer"
    }
    
    let category: String
    let type: String
    let question: String
    let answer: [String]
    let answerType: AnswerType
    let answerQuantity: Int?
    let answerKey: String?
}

public final class PracticeModeRepository: PracticeModeDataSource {
    public var practiceQuestions: [DataModel.PracticeQuestion] = []
    public var testQuestionsPublisher = CurrentValueSubject<[DataModel.PracticeQuestion], Never>([])
    public var currentScorePublisher = CurrentValueSubject<Int, Never>(0)
    public var currentQuestionPublisher: CurrentValueSubject<DataModel.PracticeQuestion?, Never> = .init(nil)
    
    private var currentQuestionIndexPublisher = CurrentValueSubject<Int, Never>(0)
    private var cancellables: Set<AnyCancellable> = []
    
    public init() {
        loadTestQuestions()
        syncCurrentQuestion()
    }
    
    func syncCurrentQuestion() {
        testQuestionsPublisher.combineLatest(currentQuestionIndexPublisher)
            .sink { [weak self] (questions, index) in
                guard let self = self else { return }
                if index >= testQuestionsPublisher.value.count - 1 {
                    return
                } else {
                    currentQuestionPublisher.send(questions[index])
                }
            }
            .store(in: &cancellables)
    }
    
    public func checkAnswer(_ indexes: [Int]) {
        guard let currentQuestion = currentQuestionPublisher.value else {
            return
        }
        var currentQuestionCorrectAnswersIndexes: [Int] = {
            switch currentQuestion.questionType {
            case let .single(question, options, answer):
                let correctAnswerIndex = options.firstIndex(of: answer)
                return [correctAnswerIndex ?? 0]
            case let .multiple(question, options, answers):
                let correctAnswerIndexes = answers.compactMap { options.firstIndex(of: $0) }
                return correctAnswerIndexes
            case .onlineCheck:
                return []
            }
        }()
        currentQuestionCorrectAnswersIndexes = currentQuestionCorrectAnswersIndexes.sorted { $0 < $1 }
        let sortedIndexes = indexes.sorted()
        let isCorrect = sortedIndexes == currentQuestionCorrectAnswersIndexes
        
        if isCorrect {
            currentScorePublisher.send(currentScorePublisher.value + 1)
        }
        currentQuestionIndexPublisher.send(currentQuestionIndexPublisher.value + 1)
    }
    
    public func loadTestQuestions() {
        guard let data = NSDataAsset(name: "100Questions")?.data else  {
            return
        }
        let decoder = JSONDecoder()
        
        do {
            let questions = try decoder.decode([Question].self, from: data)
            practiceQuestions = questions.map {
                .init(questionInput: $0)
            }
            print(practiceQuestions)
            loadRandomQuestions()
        } catch let error {
            print("[BOGUS]: \(error)")
        }
    }

    public func loadRandomQuestions(count: Int = 10) {
        testQuestionsPublisher.send(Array(practiceQuestions.shuffled().prefix(count)))
        currentQuestionIndexPublisher.send(0)
    }
}

extension DataModel.PracticeQuestion {
    init(questionInput: Question) {
        self.init(
            questionType: .getQuestionType(from: questionInput)
        )
    }
}

private extension DataModel.PracticeQuestion.QuestionType {
    static func getQuestionType(from question: Question) -> Self {
        switch question.answerType {
        case .single:
            return .single(question: question.question, options: ["1", "2", "3", question.answer[0]], correctAnswer: question.answer[0])
        case .multiple:
            return .multiple(question: question.question, options: ["1", "2", "3"] + question.answer, correctAnswer: question.answer)
        case .peopleAnswer, .stateAnswer, .interchange:
            return .onlineCheck(question: question.question)
        }
    }
}
