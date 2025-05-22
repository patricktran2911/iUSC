import Combine
import ESDataModel

public protocol StateSelectorDataSource {
    var currentUSStatePublisher: AnyPublisher<DataState.USState, Never> { get }
    
    func updateState(_ state: DataState.USState)
}
