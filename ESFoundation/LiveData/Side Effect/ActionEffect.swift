import SwiftUI
import Combine
import ESDataStructure

// MARK: - ActionEffect

/// Action Effect allows interaction with SwiftUI component to be handled by the `ViewModel`.
/// Most of the time, the `ViewModel` would already have the data needed to handle the action captured by the closure
/// So the view should not have to pass any data back
public final class ActionEffect: LiveData<Void> {
    private let onAction: () -> Void
    private let onAsyncAction: @MainActor @Sendable () async -> Void
    
    /// `actionOccurrencePublisher` allow others to subscribe for each time an action happened
    /// This is mainly useful for unit test and/or debugging
    /// Please do not use this to drive subsequent view state changes, since each time the `StreamViewModel` publish a new view
    /// It might be recreated with a different action and no longer publish to the previous stream
    public var actionOccurrencePublisher: AnyPublisher<Void, Never> {
        $latestValue.dropFirst().eraseToAnyPublisher()
    }
    
    public init(uniqueId: UniqueHash,
                onAction: @escaping () -> Void,
                onAsyncAction: @MainActor @Sendable @escaping () async -> Void) {
        self.onAction = onAction
        self.onAsyncAction = onAsyncAction
        super.init((), uniqueId: uniqueId)
    }
    
    /// Use this within SwiftUI body in response to tap actions (e.g. button tap, tap gesture, ....)
    ///
    /// ```
    /// struct OneButtonView: HashIdentifiable {
    ///     let title: String
    ///     let tapAction: ActionEffect
    /// }
    ///
    /// extension OneButtonView: View {
    ///     var body: some View {
    ///         Button(title) {
    ///             tapAction.occurs()
    ///         }
    ///     }
    /// }
    /// ```
    public func occurs() {
        updateStateSynchronously()
        
        // `Task.detached` here has the implication that the `onAction` will continue
        // beyond the view life cycle. E.g. the view may be removed from the view hierarchy after the effect is kicked off
        // but all the code parts of `onAction` will still be executed.
        Task.detached { [onAsyncAction] in
            await onAsyncAction()
        }
    }
    
    /// Use this within SwiftUI `.task` to kick off an ation
    ///
    /// ```
    /// struct TopLevelView: HashIdentifiable {
    ///     let title: String
    ///     let someNestedView: SomeNestedView
    ///     let appearAction: ActionEffect
    /// }
    ///
    /// extension OneButtonView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Text(title)
    ///             someNestedView
    ///         }
    ///         .task {
    ///             await appearAction.occursAsync()
    ///         }
    ///     }
    /// }
    /// ```
    @MainActor
    public func occursAsync() async {
        updateStateSynchronously()
        await onAsyncAction()
    }
    
    private func updateStateSynchronously() {
        latestValue = ()
        onAction()
    }
}

public extension ActionEffect {
    
    // MARK: - Factory
    
    /// Use this within ViewModel subclass in order to provide the handler for the effect
    /// This can be used with either `async` or synchronous function.
    /// The example below assumes `func refresh() async` from the datasource
    /// If there is no `async` operation within the performing closure, then the compiler will pick the overloaded version of this
    ///
    /// ```
    /// final class OneButtonViewModel: SingleViewModel<OneButtonView> {
    ///     init(dataSource: IItemListDataSource) {
    ///         super.init {
    ///             OneButtonView(
    ///                 title: "Refresh"
    ///                 tapAction: .performing {
    ///                     await dataSource.refresh()
    ///                 }
    ///             )
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// The naming here is purely for readability distinction
    static func performing(_ action: @MainActor @Sendable @escaping () async -> Void) -> ActionEffect {
        .init(uniqueId: .componentUniqueHash, onAction: {}, onAsyncAction: {@MainActor in
            await action()
        })
    }
    
    /// Overloaded function for `.performing` without `async` operation
    /// We leverage the compiler to do the lifting of picking async vs. non-async operation
    static func performing(_ action: @escaping () -> Void) -> ActionEffect {
        .init(uniqueId: .componentUniqueHash, onAction: action, onAsyncAction: {})
    }
    
    /// Overloaded function for `.performing` to handle @MainActor
    /// any action passed in here will be async on main thread if triggered not from a background task
    static func performing(_ action: @MainActor @escaping () -> Void) -> ActionEffect {
        .init(uniqueId: .componentUniqueHash, onAction: {}, onAsyncAction: action)
    }

    /// Preview canvas should just use `.noEffect()`
    static func noEffect() -> ActionEffect {
        .init(uniqueId: .constantHash, onAction: {}, onAsyncAction: {})
    }
}

extension ActionEffect: CustomStringConvertible, CustomDebugStringConvertible {
    
    /// Removing all closure print out from effect description
    /// So that we have a clean debug view of just the value
    public var description: String {
        return "Action Effect"
    }
    
    public var debugDescription: String {
        description
    }
}
