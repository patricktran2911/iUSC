import SwiftUI
import Combine
import ESDataStructure

// MARK: - LiveData

/// `LiveData` provides the mechanism for observing changes from any value stream and store the `latestValue`.
/// Typically, you would never have to use this class directly. Rather, there are several derived classes from this that you can inherit from. Currently, this is being used to implement `StreamViewModel` and `ValueChangedEffect`
/// Since `LiveData` conformed to `HashIdentifiable`, itself and any of its subclass can be nested inside another `HashIdentifiable` container.
/// Future iteration should attempt to switch from inheritance to composition so that this class can be kept internal, and only exposed the MVVM components (e.g. ViewModel, SideEffect).
open class LiveData<Value>: ObservableObject, HashIdentifiable {
    
    /// Observing the latest value, this should never be made `public`
    /// Each subclass will provide proper public accessor for this.
    @Published var latestValue: Value
    private let uniqueId: UniqueHash
    
    public init(_ latestValue: Value, uniqueId: UniqueHash = .componentUniqueHash) {
        self.latestValue = latestValue
        self.uniqueId = uniqueId
    }

    /// Manually updating the `latestValue`
    func update(_ latestValue: Value) {
        self.latestValue = latestValue
    }
    
    /// Connecting the stream of a matching `publisher` to update the latest value
    /// You can perform `.map()` operator on the publisher to translate the data model if your publisher emit a different types other than `Value`
    func observeUpdates(from publisher: AnyPublisher<Value, Never>) {
        publisher.assign(to: &$latestValue)
    }
    
    public static func == (lhs: LiveData<Value>, rhs: LiveData<Value>) -> Bool {
        if lhs.uniqueId == .constantHash || rhs.uniqueId == .constantHash {
            return true
        }
        
        return lhs.uniqueId == rhs.uniqueId
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(uniqueId)
    }
}
