import Foundation
import SwiftUI
import Combine

/// The ViewModel to render any other viewModels onto preview canvas
///
/// This is done by observing updates from the same stream that publish the dataView of the rendering viewModel
/// to rendering the same view of that viewModel.
///
/// There is no occasion we would need to directly initializing this
/// Use the static method `previewCanvas(_:)` in the `View` extension instead
public final class CanvasViewModel<DataView: HashIdentifiableView>: StreamViewModel<DataView> {
    
    public init() {
        super.init()
    }
    
    @MainActor
    init<DiscardableResult>(
        _ dataViewType: DataView.Type = DataView.self,
        canvasCreation: @MainActor @escaping (CanvasViewModel<DataView>) async throws -> DiscardableResult
    ) {
        super.init()
        Task {
            _ = try? await canvasCreation(self)
        }
    }
    
    // MARK: - Overloading Render
    
    @MainActor
    public func render(_ dataView: DataView) {
        observeUpdates(
            from: Just(.loaded(dataView)).eraseToAnyPublisher()
        )
    }
    
    @MainActor
    public func alsoRender<DV: HashIdentifiableView>(_ dataView: DV) {
        observeUpdates(
            from: Just(.loading(dataView)).eraseToAnyPublisher()
        )
    }

    @MainActor
    public func render<Provider: DataViewPublishable>(_ provider: Provider) where Provider.DV == DataView {
        observeUpdates(
            from: provider.dataViewStatePublisher
        )
    }

    @MainActor
    public func alsoRender<Provider: DataViewPublishable>(_ provider: Provider) {
        observeUpdates(
            from: provider.dataViewStatePublisher
                .map {.loading($0) }.eraseToAnyPublisher()
        )
    }
    
    @MainActor
    public func reset() async {
        observeUpdates(
            from: Just(.hidden).eraseToAnyPublisher()
        )
        
        // Sleep on background, awaiting all rendering complete on main
        await MainActor.run {}
        // Resuming back on main
    }
}

// MARK: - Convenient Canvas Creation

public extension View where Self: HashIdentifiableView {
    /// Creating the canvas for previewing the `dataView()` output of any given viewModel
    ///
    /// This is syntatic-sugar so that we can render any viewModel in a similar fashion with static view previews.
    /// For those, we currently do
    /// ```
    /// #Preview {
    ///     SomeCustomView.previewSomeCustomView()
    /// }
    /// ```
    /// With this extension, we can employ similar fashion when trying to preview ViewModel
    /// ```
    /// #Preview {
    ///     SomeCustomView.previewCanvas { canvas in
    ///         
    ///         // `render(_:)` requires SomeCustomViewModel to create matching SomeCustomView
    ///         // If you need to render a viewModel that creates a different view type
    ///         // use `alsoRender(_:)` instead
    ///
    ///         canvas.render(SomeCustomViewModel())
    ///     }
    /// }
    /// ```
    ///
    /// Since `canvasCreation` is an async throws closure, we can perform any logic
    /// such as mocking data, wiring up dependencies, ... to setup the proper state for the ViewModel
    /// before rendering it onto the canvas.
    /// ```
    /// #Preview {
    ///     SomeCustomView.previewCanvas { canvas in
    ///
    ///         // a hypthetical code of mocking an experiment enabling
    ///         let resolver = SomeResolver()
    ///         resolver.enableDevFeature = FactoryResolver { true }
    ///
    ///         canvas.render(SomeCustomViewModel(resolver: resolver))
    ///     }
    /// }
    /// ```
    ///
    /// Combining this with GherkinSpec, we can preview any unit test spec in the same fashion.
    /// `IGherkinContextPreviewable` and `IGherkinOutcomePreviewable` provides a convenient `.render` and `.alsoRender` that can be easily tag onto any Gherkin spec
    ///```
    /// #Preview {
    ///     SomeCustomView.previewCanvas { canvas in
    ///
    ///         UnitTest.given {
    ///             let resolver = SomeResolver()
    ///             resolver.enableDevFeature = FactoryResolver { true }
    ///             return SomeCustomViewModel(resolver: resolver)
    ///         }
    ///         .render(\.context, onto: canvas) // the context here is `SomeCustomViewModel`
    ///         .when { (context: SomeCustomViewModel) in
    ///             context.performSomeTestAction()
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// Accessing viewModel can be done via swift KeyPath, hence it always start with `\.context`
    /// If the context itself is the viewModel, then nothing else needed.
    /// Otherwise, if you have a custom context
    /// ```
    /// struct CustomContext {
    ///     let dataSource: SomeDataSource
    ///     let customViewModel: SomeCustomViewModel
    /// }
    /// ```
    /// Then the render call would be `render(\.context.customViewModel, onto: canvas)`
    @MainActor
    static func previewCanvas<DiscardableResult>(
        canvasCreation: @MainActor @escaping (CanvasViewModel<Self>) async throws -> DiscardableResult
    ) -> some View {
        CanvasViewModel(Self.self, canvasCreation: canvasCreation)
            .observedDataView()
    }
}
