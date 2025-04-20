import Combine
import SwiftUI
import ESDataStructure

// MARK: - ValueChangedEffect

/// ValueChanged Effect allows state changes in SwiftUI component that has `Binding<Value>` to be handled by the `ViewModel`.
/// This is a on-way observing, which means changes in the view component (e.g. `TextField`) will trigger the action in the ViewModel
/// But updating the `latestValue` of this effect does not cause view to be redrawn / updated.
public final class ValueChangedEffect<Value: Equatable & Sendable>: LiveData<Value> {
    
    private let onChanged: (Value, Value) -> Void
    private let onUpdated: @MainActor @Sendable (Value) async -> Void
    
    public init(initialValue: Value,
                uniqueId: UniqueHash,
                onChanged: @escaping (Value, Value) -> Void,
                onUpdated: @MainActor @Sendable @escaping (Value) async -> Void) {
        self.onChanged = onChanged
        self.onUpdated = onUpdated
        super.init(initialValue, uniqueId: uniqueId)
    }
    
    /// Provide access to the latest value
    /// E.g. if you want to grab the text value of an input form on submission
    public var currentValue: Value {
        latestValue
    }
    
    /// `currentValuePublisher` allow others to subscribe to current value everytime it is updated
    /// You will need to perform `dropFirst` if you want to ignore the initial value
    /// This is mainly useful for unit test and/or debugging
    /// Please do not use this to drive subsequent view state changes, since each time the `StreamViewModel` publish a new view
    /// It might be recreated with a different action and no longer publish to the previous stream
    public var currentValuePublisher: AnyPublisher<Value, Never> {
        $latestValue.eraseToAnyPublisher()
    }
    
    /// Use this within SwiftUI body to provide the binding value for any component that requires `@Binding`
    /// This is a one-way state observing.
    ///
    /// ```
    /// struct FormInputView: HashIdentifiable {
    ///     let placeholder: String
    ///     let textChangedAction: ValueChangedEffect<String>
    /// }
    ///
    /// extension FormInputView: View {
    ///     var body: some View {
    ///         TextField(placeholder, text: textChangeAction.binding)
    ///     }
    /// }
    /// ```
    /// Resource
    /// https://developer.apple.com/tutorials/swiftui-concepts/defining-the-source-of-truth-using-a-custom-binding
    @MainActor
    public var binding: Binding<Value> {
        Binding {
            self.latestValue
        } set: { [weak self] updatedValue in
            self?.update(updatedValue)
        }
    }
    
    /// This is mainly intended to be used by the `binding` access above
    /// However, there has been occasions that this is used to pass data from view to viewModel
    /// Most of the time, `ViewModel` should already the data so this should rarely be used in the view
    /// This function is also useful for unit test to wait for an update before making assertion
    public override func update(_ updatedValue: Value) {
        notifyChangeSynchronously(updatedValue)
        
        // `Task.detached` here has the implication that the `onUpdated` will continue
        // beyond the view life cycle. E.g. the view may be removed from the view hierarchy after the effect is kicked off
        // but all the code parts of `onUpdated` will still be executed.
        Task.detached { [onUpdated] in
            await onUpdated(updatedValue)
        }
    }
    
    /// This function is mainly useful for unit test to wait for an update before making assertion
    /// Rarely would we ever wants to call this directly from SwiftUI
    @MainActor
    public func updateAsync(_ updatedValue: Value) async {
        notifyChangeSynchronously(updatedValue)
        await onUpdated(updatedValue)
    }
    
    /// `notifyChangeSynchronously` need to be called on main under all circumstances
    /// But not marking this `@MainActor` to avoid threading implication for unit test.
    private func notifyChangeSynchronously(_ updatedValue: Value) {
        let currentValue = latestValue
        if updatedValue != currentValue {
            latestValue = updatedValue
            onChanged(currentValue, updatedValue)
        }
    }
    
    // MARK: - Factory
    
    /// Use this within ViewModel subclass in order to provide the side-effect handler
    /// This only triggered if there is an updated value that is different from the previous value
    /// The action handler provides both the previous and the updated value
    ///
    /// ```
    /// final class FormInputViewModel: SingleViewModel<FormInputView> {
    ///     init(dataSource: FormSubmissionDataSource) {
    ///         super.init {
    ///             FormInputView(
    ///                 placeholder: "First Name"
    ///                 textChangedAction: .onChange(fromInitial: "") { previousText, updatedText in
    ///                     dataSource.validateName(updatedText)
    ///                 }
    ///             )
    ///         }
    ///     }
    /// }
    /// ```
    /// `action` closure will be called synchronously on main thread
    public static func onChanged<T>(fromInitial value: T, action: @escaping (T, T) -> Void) -> ValueChangedEffect<T> {
        .init(initialValue: value,
              uniqueId: .componentUniqueHash,
              onChanged: action,
              onUpdated: { _ in })
    }
    
    /// Use this within ViewModel subclass in order to provide the side-effect handler
    /// This will be triggered whether the updated value is the same or different with previous value
    /// It can also be used in conjunction with async function from DataSource
    /// The example belows assumes `func searchForQuery(_:) async` from the datasource
    ///
    /// ```
    /// final class FormInputViewModel: SingleViewModel<FormInputView> {
    ///     init(dataSource: FormSubmissionDataSource) {
    ///         super.init {
    ///             FormInputView(
    ///                 placeholder: "Enter an address"
    ///                 textChangedAction: .onUpdated(fromInitial: "") { updatedText in
    ///                     await dataSource.searchForQuery(updatedText)
    ///                 }
    ///             )
    ///         }
    ///     }
    /// }
    /// ```
    ///
    public static func onUpdated<T>(fromInitial value: T, action: @MainActor @Sendable @escaping (T) async -> Void) -> ValueChangedEffect<T> {
        .init(initialValue: value,
              uniqueId: .componentUniqueHash,
              onChanged: { _, _ in },
              onUpdated: action)
    }
    
    /// Preview canvas should just use `.noEffect()`
    public static func noEffect<T>(_ initialValue: T) -> ValueChangedEffect<T> {
        .init(initialValue: initialValue,
              uniqueId: .constantHash,
              onChanged: { _, _ in },
              onUpdated: { _ in })
    }
}

extension ValueChangedEffect: CustomStringConvertible, CustomDebugStringConvertible {
    /// Removing all closure print out from effect description
    /// So that we have a clean debug view of just the value
    public var description: String {
        return "ValueChagedEffect - \(latestValue)"
    }
    
    public var debugDescription: String {
        description
    }
}

public extension ValueChangedEffect where Value == Bool {
    func toggle() {
        update(!currentValue)
    }
}
