import Combine
import UIKit
import Foundation
import ESDataSource
import ESDataModel



public final class PracticeModeRepository: PracticeModeDataSource {
    public var practiceQuestions: [DataModel.PracticeQuestion] = []
    public var testQuestionsPublisher = CurrentValueSubject<[DataModel.PracticeQuestion], Never>([])
    public var currentScorePublisher = CurrentValueSubject<Int, Never>(0)
    public var currentQuestionPublisher: CurrentValueSubject<DataModel.PracticeQuestion?, Never> = .init(nil)
    public var testStatePublisher: CurrentValueSubject<DataState.TestState, Never> = .init(.inProgress)
    
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
                if index >= testQuestionsPublisher.value.count {
                    testStatePublisher.send(.complete)
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
            case let .single(_, options, answer):
                let correctAnswerIndex = options.firstIndex(of: answer)
                return [correctAnswerIndex ?? 0]
            case let .multiple(_, options, answers):
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
    
    public func checkAnswerOnline(_ answer: String) {
        currentScorePublisher.send(currentScorePublisher.value + 1)
        currentQuestionIndexPublisher.send(currentQuestionIndexPublisher.value + 1)
    }
    
    public func loadTestQuestions() {
        guard let data = NSDataAsset(name: "100Questions")?.data else  {
            return
        }
        let decoder = JSONDecoder()
        
        do {
            let questions = try decoder.decode([DataModel.QuestionDecoded].self, from: data)
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
        currentScorePublisher.send(0)
    }
}

fileprivate extension DataModel.PracticeQuestion {
    init(questionInput: DataModel.QuestionDecoded) {
        self.init(
            questionType: .getQuestionType(from: questionInput)
        )
    }
}

private extension DataModel.PracticeQuestion.QuestionType {
    static func getQuestionType(from question: DataModel.QuestionDecoded) -> Self {
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
