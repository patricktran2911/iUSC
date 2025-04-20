import SwiftUI
import Combine
import ESDataStructure

// MARK: - StreamViewModel

/// The ViewModel that can react to a stream of datasource updates to build and re-build `DataView` over time.
/// The output of this view model is `DataViewState<DataView>`, which wrap the `DataView` within a state enum
///
/// The possible values are
/// `.hidden` putting an `EmptyView` in the SwiftUI view hierarchy.
/// `.loading(_:)`putting a custom view in the SwiftUI view hierarchy. This can be any `HashIdentifiableView`.
/// `.loaded(dataView)`putting the `DataView` in the SwiftUI view hierarchy.
///
/// The subclass of this view model can update this state at any given time
/// using `update(_ latestValue:)` function provided by superclass,`LiveData`, to publish a different state,
/// or using `updateDataView(_ dataView:)` to publish a `.loaded` state with specific `DataView`.
open class StreamViewModel<DataView: HashIdentifiableView>: LiveData<DataViewState<DataView>> {
    
    /// Providing the observation for any external class that is interested in the state changed within this `ViewModel`
    /// This is useful for UIKit interop (e.g. updating `UITableView` constraints when the SwiftUI state changed.
    public var statePublisher: AnyPublisher<DataViewState<DataView>, Never> {
        $latestValue.eraseToAnyPublisher()
    }
    
    /// Providing the initial state for the view built by this ViewModel. Default is `.hidden`
    public init(initialState: DataViewState<DataView> = .hidden) {
        super.init(initialState)
    }
    
    /// Connecting the stream of a matching `publisher` to update the state
    /// You can perform `.map()` operator on the publisher to translate the data model if your publisher emit a different types other than `DataViewState`
    public init(statePublisher: AnyPublisher<DataViewState<DataView>, Never>) {
        // Initially hidden
        super.init(.hidden)
        observeUpdates(from: statePublisher)
    }
    
    /// Connecting the stream of a matching `publisher` to update the `DataView`
    /// This assume that the `DataView` built by this `ViewModel` never have to handle `.loading` state
    /// It will initial be `.hidden`, and when a new value is emmited from the publisher, it will change to the `.loaded` state with specific `DataView`
    public init(dataViewPublisher: AnyPublisher<DataView, Never>) {
        super.init(.hidden)
        observeUpdates(from: dataViewPublisher)
    }
    
    /// Connecting the stream of a matching `publisher` to update the state
    /// You can perform `.map()` operator on the publisher to translate the data model if your publisher emit a different types other than `DataViewState`
    public override func observeUpdates(from statePublisher: AnyPublisher<DataViewState<DataView>, Never>) {
        super.observeUpdates(from: statePublisher)
    }
    
    /// Connecting the stream of a matching `publisher` to update the `DataView`
    /// You can perform `.map()` operator on the publisher to translate the data model if your publisher emit a different types other than `DataView`
    /// This assumes that the view does not have to handle `.loading` state
    public func observeUpdates(from dataViewPublisher: AnyPublisher<DataView, Never>) {
        observeUpdates(from: dataViewPublisher
            .map { .loaded($0) }
            .eraseToAnyPublisher()
        )
    }
    
    /// Manually update the `DataView` for `.loaded` state.
    /// This is useful to perform subsequent updates to the initial loaded state.
    /// In a uni-directional data flow. This should be very rarely used.
    public func updateDataView(_ dataView: DataView) {
        update(.loaded(dataView))
    }
    
    // MARK: - Future guard rail
    
    // Intentionally not implementing the init below
    // ```
    //    public init(_ latestValue: DataView) {
    //       super.init(.loaded(latestValue))
    //    }
    // ```
    // `DataViewModel` is meant to observed data that may not yet be ready.
    // If you already have the data to begin with, subclassing `SingleViewModel` instead.
}

// MARK: - DataViewState

/// `DataView` states that will be published by `StreamViewModel`
public enum DataViewState<DataView: HashIdentifiableView>: HashIdentifiable {
    
    /// Hidden
    case hidden
    
    /// Data is pending, showing a custom loading view that conformed to `HashIdentifiableView`
    /// We should not abuse this loading state to have complicated view switching mechanism,
    /// since this use `AnyView` type erasure underneath and reduce the performance of SwiftUI diffing engine.
    /// Whichever view associated with this state should have very simple structure.
    case loading(any HashIdentifiableView)
    
    /// Terminal state, we successfully transformed the data into `DataView`. Showing it.
    case loaded(_ dataView: DataView)
    
    // MARK: HashIdentifiable
    
    public static func == (lhs: DataViewState<DataView>, rhs: DataViewState<DataView>) -> Bool {
        switch (lhs, rhs) {
        case (.hidden, .hidden):
            return true
        case let (.loading(lhs), .loading(rhs)):
            return lhs.hashValue == rhs.hashValue
        case let (.loaded(lhs), .loaded(rhs)):
            return lhs == rhs
        default:
            return false
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        switch self {
        case .hidden:
            hasher.combine("\(DataView.self)")
        case .loading(let dataView):
            hasher.combine(dataView)
        case .loaded(let dataView):
            hasher.combine(dataView)
        }
    }
}

extension DataViewState: View {
    
    public var body: some View {
        switch self {
        case .hidden:
            EmptyView()
        case .loading(let dataView):
            AnyView(dataView)
        case .loaded(let dataView):
            dataView
        }
    }
}

// MARK: - Convenient Accessor

public extension DataViewState {
    var isHidden: Bool {
        return self == .hidden
    }
    
    func loadingDataView<V: HashIdentifiableView>() -> V? {
        if case .loading(let loadingView) = self {
            return loadingView as? V
        }
        return nil
    }
    
    func dataView() -> DataView? {
        if case .loaded(let dataView) = self {
            return dataView
        }
        return nil
    }
}


public extension StreamViewModel {
    var isViewHidden: Bool {
        latestValue.isHidden
    }
    
    func loadingDataView<V: HashIdentifiableView>() -> V? {
        latestValue.loadingDataView()
    }
    
    func dataView() -> DataView? {
        latestValue.dataView()
    }
}

#if targetEnvironment(simulator)
public extension StreamViewModel {
    @MainActor
    func preview() -> some HashIdentifiableView {
        DataView.viewObserved(stream: self)
    }
}
#endif
