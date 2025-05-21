import Combine
import ESDataModel

public protocol USCDataSource {
    var currentOfficersPublisher: AnyPublisher<DataModel.USStateOfficers, Never> { get }
    var uscis100QuestionsPublisher: AnyPublisher<[DataModel.QuestionDecoded], Never> { get }
}
