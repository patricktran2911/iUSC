import Combine
import ESDataModel

public protocol PracticeModeDataSource {
    var testQuestionsPublisher: CurrentValueSubject<[DataModel.PracticeQuestion], Never> { get }
    var currentQuestionPublisher: CurrentValueSubject<DataModel.PracticeQuestion?, Never> { get }
    var currentScorePublisher: CurrentValueSubject<Int, Never> { get set }
        
    func checkAnswer(_ indexes: [Int])
    
    func loadTestQuestions()

    func loadRandomQuestions(count: Int)
}
