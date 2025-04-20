import Foundation
import SwiftUI

/// Documentation on which device layout is applicable for this
/// https://developer.apple.com/design/human-interface-guidelines/layout
///
/// Why are we not using `ViewThatFits`
/// https://moveinc.atlassian.net/wiki/spaces/MIOS/pages/116948828483/Spike+-+Adaptive+Layout
public protocol AdaptiveLayoutRegularWidthHeight {
    associatedtype BodyView: View
    
    /// Providing the alternative layout for when the view size transition to regular width / regular height
    /// The `body` implementation should attempt to cover all view sizes and use this only for complex layout decision.
    /// A good practice is creating a `commonLayout()` function to share between the regular `body` and this layout
    /// to highlight the diff between main layout and this one.
    @ViewBuilder
    func bodyForRegularWidthHeightSizeClass() -> BodyView
}

/// This extension enables any `ObservedDataView` to have `.adaptiveLayout()` modifier
extension ObservedDataView where DataView: AdaptiveLayoutRegularWidthHeight {
    @ViewBuilder @MainActor
    public func adaptiveLayout() -> some View {
        switch self {
        // In the .stateless case, we manually create the highest abstraction of the view model which is `LiveData`
        // This enables any `HashIdentifiableView` that adopts `AdaptiveLayoutRegularWidthHeight` to use `.adaptiveLayout()`
        // without the need to be converted to `ObservedDataView`
        // the extension on `AdaptiveLayoutRegularWidthHeight` in the section belows basically just create and render an `ObservedDataView` internally since any `HashIdentifiableView` can be converted to `ObservedDataView` using the `.stateless` case
        case .stateless(let dataView):
            LiveData(dataView).observedAdaptiveLayout { dataView, layout in
                Self.selectLayoutFor(dataViewState: .loaded(dataView), layout: layout)
            }
        
        // `.stateful` code is where a view model is being supplied
        case .stateful(let liveData):
            liveData.observedAdaptiveLayout { state, layout in
                Self.selectLayoutFor(dataViewState: state, layout: layout)
            }
            
        case .hidden:
            EmptyView()
        }
    }
    
    @ViewBuilder
    private static func selectLayoutFor(dataViewState: DataViewState<DataView>, layout: AdaptiveLayout) -> some View {
        switch dataViewState {
        case .hidden, .loading:
            dataViewState
        case .loaded(let dataView):
            if case .regularWidthHeight = layout {
                dataView.bodyForRegularWidthHeightSizeClass()
            } else {
                dataView
            }
        }
    }
}

/// This extension enables any `HashIdentifiableView` to have `.adaptiveLayout()` modifier
extension AdaptiveLayoutRegularWidthHeight where Self: HashIdentifiableView {
    @ViewBuilder @MainActor
    public func adaptiveLayout() -> some View {
        ObservedDataView.stateless(self).adaptiveLayout()
    }
}
