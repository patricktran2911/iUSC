import Combine
import ESDataModel

public protocol StateSelectorDataSource {
    var currentUSStatePublisher: AnyPublisher<DataState.USState, Never> { get }
    var stateSearchPublisher: AnyPublisher<[DataState.USState], Never> { get }
    var currentSearchTextPublisher: AnyPublisher<String, Never> { get }
    
    func updateState(_ state: DataState.USState)
    
    func updateSearchBar(_ searchText: String)
}
