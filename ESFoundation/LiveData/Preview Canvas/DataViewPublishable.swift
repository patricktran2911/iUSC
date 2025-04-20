import Foundation
import Combine

/// The naming to be more glancable for xcode autocomplete suggestion
public protocol DataViewPublishable {
    associatedtype DV: HashIdentifiableView
    
    /// Providing the stream of `DataViewState`
    var dataViewStatePublisher: AnyPublisher<DataViewState<DV>, Never> { get }
}

// MARK: - Adopting For StreamViewModel and SingleViewModel

extension StreamViewModel: DataViewPublishable {
    public var dataViewStatePublisher: AnyPublisher<DataViewState<DataView>, Never> {
        statePublisher.eraseToAnyPublisher()
    }
}

extension SingleViewModel: DataViewPublishable {
    public var dataViewStatePublisher: AnyPublisher<DataViewState<DataView>, Never> {
        Just(.loaded(dataView())).eraseToAnyPublisher()
    }
}
