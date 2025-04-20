import Foundation
import Combine

/// Bridging between Combine publisher and Async/await
public protocol AsyncSubscriber<Input>: Subscriber where Input == Input, Failure == Never {
    func asyncOn(inputReceived: @MainActor @escaping (Input) async -> Void) -> Self

    var task: Task<(), Error>? { get }
}

/// A subscriber that will kick off async await code on main thread
/// whenever it receives a new Input from the publisher.
public final class MainTaskSubscriber<Input: Sendable>: AsyncSubscriber {
    public private(set) var task: Task<(), Error>?

    public let combineIdentifier = CombineIdentifier()
    private var onInputReceived: (@MainActor (Input) async -> Void)?
    
    private let isCancellable: Bool
    
    /// In order for `isCancellable` to take effect, the actual async work will need to implement `Task.checkCancellation()`
    /// to decide which portion of the async work should be no-op upon cancellation
    public init(isCancellable: Bool = false) {
        self.isCancellable = isCancellable
    }
    
    public func receive(subscription: Subscription) {
        subscription.request(.unlimited)
    }
    
    /// This code assumes that the publisher receive all its input on the same thread
    /// hence accessing the `task` does not require locking
    public func receive(_ input: Input) -> Subscribers.Demand {
        if isCancellable {
            task?.cancel()
        }
        
        task = Task { @MainActor [onInputReceived] in
            await onInputReceived?(input)
        }
        return .unlimited
    }
    
    public func asyncOn(inputReceived: @MainActor @escaping (Input) async -> Void) -> Self {
        onInputReceived = inputReceived
        return self
    }
    
    public func receive(completion: Subscribers.Completion<Never>) {
        // no-op since we have `Never` failure type
    }
}
