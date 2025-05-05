import Combine
import ESDataModel

public protocol PracticeModeDataSource {
    var testQuestionsPublisher: CurrentValueSubject<[DataModel.PracticeQuestion], Never> { get }
    var currentQuestionPublisher: CurrentValueSubject<DataModel.PracticeQuestion?, Never> { get }
    var testStatePublisher: CurrentValueSubject<DataState.TestState, Never> { get }
    var currentScorePublisher: CurrentValueSubject<Int, Never> { get set }
        
    func checkAnswer(_ indexes: [Int])
    
    func checkAnswerOnline(_ answer: String)
    
    func loadTestQuestions()

    func loadRandomQuestions(count: Int)
}
