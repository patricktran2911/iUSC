import SwiftUI
import ESDataStructure

// MARK: - ObservedDataView

public enum ObservedDataView<DataView: HashIdentifiableView>: HashIdentifiable {
    
    /// a static DataView that will not be updated
    /// You should NOT use this case directly. Please use the public static functions in the factory section below.
    case stateless(DataView)
    
    /// a dynamic DataView that can observe the latest value from any live data that publishing state
    /// You should NOT use this case directly. Please use the public static functions in the factory section below.
    case stateful(LiveData<DataViewState<DataView>>)
    
    /// a stop-gap solution before we switch `stateless` to support all states in `DataViewState`
    case hidden
    
    public static func == (lhs: ObservedDataView<DataView>, rhs: ObservedDataView<DataView>) -> Bool {
        switch (lhs, rhs) {
        case let (.stateless(lDataView), .stateless(rDataView)):
            return lDataView == rDataView
        case let (.stateful(lViewModel), .stateful(rViewModel)):
            return lViewModel == rViewModel
        case let (.stateful(lViewModel), .stateless(rDataView)):
            return lViewModel.latestValue == .loaded(rDataView)
        case let (.stateless(lDataView), .stateful(rViewModel)):
            return .loaded(lDataView) == rViewModel.latestValue
        case let (.stateful(lViewModel), .hidden):
            return lViewModel.latestValue == .hidden
        case let (.hidden, .stateful(rViewModel)):
            return .hidden == rViewModel.latestValue
        case (.stateless, .hidden), (.hidden, .stateless):
            return false
        case (.hidden, .hidden):
            return true
        }
    }
}

extension ObservedDataView: View {
    
    public var body: some View {
        switch self {
        case .stateless(let dataView):
            dataView
        case .stateful(let dataViewModel):
            dataViewModel.observedDataView()
        case .hidden:
            EmptyView()
        }
    }
    
    @ViewBuilder @MainActor
    public func onUpdate<V: View>(@ViewBuilder _ transformed: @escaping (DataView) -> V) -> some View {
        switch self {
        case .hidden:
            EmptyView()
        case .stateless(let dataView):
            dataView
        case .stateful(let liveData):
            liveData.observedDataView { state in
                switch state {
                case .hidden,  .loading:
                    body
                case .loaded(let dataView):
                    transformed(dataView)
                }
            }
        }
    }
    
    @ViewBuilder @MainActor
    func adaptiveLayout<V: View>(@ViewBuilder _ transformed: @escaping (DataView, AdaptiveLayout) -> V) -> some View {
        switch self {
        case .hidden:
            EmptyView()
        case .stateless(let dataView):
            transformed(dataView, .main)
        case .stateful(let liveData):
            liveData.observedAdaptiveLayout { state, layout in
                switch state {
                case .hidden,  .loading:
                    state
                case .loaded(let dataView):
                    transformed(dataView, layout)
                }
            }
        }
    }

    public func update(_ dataView: DataView) {
        guard let viewModel = associatedViewModel() else {
            assertionFailure("view not observing any stream of update, use one of the factory function `.viewObserving` to construct the view")
            return
        }

        viewModel.updateDataView(dataView)
    }
}

// MARK: - Factory

public extension Hashable {
    static func viewBuilt<DV>(from viewModel: SingleViewModel<DV>) -> DV {
        viewModel.resultDataView
    }
    
    static func viewObserved<DV>(stream viewModel: StreamViewModel<DV>) -> ObservedDataView<DV> {
        .stateful(viewModel)
    }
    
    static func viewRendered<DV>(from state: DataViewState<DV>) -> ObservedDataView<DV> {
        .stateful(StreamViewModel(initialState: state))
    }
}

// MARK: - Preview Helpers

#if targetEnvironment(simulator)
public extension Hashable {
    static func const<DV>(_ previewDataView: DV?) -> ObservedDataView<DV> {
        if let preview = previewDataView {
            return .stateless(preview)
        } else {
            // In the future we should be able to support `.stateless(.hidden)`
            return .hidden
        }
    }
}

public extension Optional where Wrapped: HashIdentifiableView {
    func unwrap() -> ObservedDataView<Wrapped> {
        switch self {
        case .none:
            return .hidden
        case .some(let wrapped):
            return .stateless(wrapped)
        }
    }
}
#endif

// MARK: - Convenient Accessor

public extension ObservedDataView {
    var isHidden: Bool {
        if case .stateful(let liveData) = self {
            return liveData.latestValue.isHidden
        }
        return false
    }
    
    func loadingDataView<V: HashIdentifiableView>() -> V? {
        if case .stateful(let liveData) = self {
            return liveData.latestValue.loadingDataView()
        }
        return nil
    }
    
    func dataView() -> DataView? {
        switch self {
        case .hidden:
            return nil
        case .stateless(let dataView):
            return dataView
        case .stateful(let liveData):
            return liveData.latestValue.dataView()
        }
    }
    
    /// Retrieve the view model associated with the view
    /// This is useful when you need to provide update to a child/sibling view in response to certain side-effect.
    /// Only applicable when this `ObservedDataView` is backed by a `StreamViewModel`
    /// Intentionally making the name distinguished in order for us to search for anti-pattern usage
    /// Please use this only when you really have to.
    func associatedViewModel<VM: StreamViewModel<DataView>>() -> VM? {
        if case .stateful(let liveData) = self {
            return liveData as? VM
        }
        
        return nil
    }
}
