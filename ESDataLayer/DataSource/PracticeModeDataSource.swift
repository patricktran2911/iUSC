import Combine
import ESDataModel

@MainActor
public protocol PracticeModeDataSource {
    var currentUSStateOfficersPublisher: AnyPublisher<DataModel.USStateOfficers?, Never> { get }
    var testQuestionsPublisher: AnyPublisher<[DataModel.PracticeQuestion], Never> { get }
    var currentQuestionPublisher: AnyPublisher<DataModel.PracticeQuestion?, Never> { get }
    var testStatePublisher: AnyPublisher<DataState.TestState, Never> { get }
    var practiceScorePublisher: AnyPublisher<Int, Never> { get }
    var currentAreaTestPublisher: AnyPublisher<DataState.USState?, Never> { get }
    var showStatePickerPublisher: AnyPublisher<Bool, Never> { get }
        
    func checkAnswer(_ indexes: [Int])
    
    func checkAnswerOnline(_ answer: String)
    
    func updateTestState(_ state: DataState.USState)
    
    func loadTestQuestions()
    
    func showStatePicker(_ isShowed: Bool)

    func loadRandomQuestions(count: Int)
}
