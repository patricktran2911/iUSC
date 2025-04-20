import SwiftUI

// MARK: - SingleViewModel

/// The ViewModel to build a single `DataView`, the output of this ViewModel is `DataView`
///
/// Subclassing this when you need to build a view only once and does not need to provide future updates to it.
/// The nesting sub-views of `DataView` can be dynamic and being built from other sub-`StreamViewModel`(s),
/// but as long as you don't need to rebuild the entire `DataView` at any given time during its displaying life-cycle,
/// `SingleViewModel` would be the simplest / lightest tool to build your view.
///
/// You can creates an `ObservedDataView` from a `SingleViewModel` using `.viewBuilt(fromSingle:)` factory method.
///
/// Some benefits of subclassing `SingleViewModel` to build your view instead of creating the view directly (besides consistency)
///
/// - Reusability: if others need to build this view from the same datasource,
/// they can just grab the view model instead of having to concstruct every layer of the view.
/// they can also tweak initialization if the view being built from a different datasource.
///
/// - Debug: Since the closest presentation of a view is being produced by the view model,
/// and there are only two (`SingleViewModel` and `StreamViewModel`),
/// we have a centralized place for breakpoint / print statement to debug the view hierarchy.
///
/// For basic views that are not composed from another `HashIdentifiableView` and have minimal number of properties,
/// You may consider creating the view directly since the benefit of using this view model is miminal in those scenario.
open class SingleViewModel<DataView: HashIdentifiableView> {
    
    let resultDataView: DataView
    
    /// Providing the function to build the `DataView`.
    /// This class will be out of scope after the building function complete,
    /// Therefore you should not keep any state (e.g. local var) when subclassing this view model.
    /// This is intenteded for the use case where you need to build the same view presentation using different datasources.
    public init(viewBuilder: () -> DataView) {
        resultDataView = viewBuilder()
    }
}

// MARK: - Convenient Accessors

public extension SingleViewModel {
    func dataView() -> DataView {
        resultDataView
    }
}

#if targetEnvironment(simulator)
public extension SingleViewModel {
    func preview() -> DataView {
        dataView()
    }
}
#endif
