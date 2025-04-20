import Combine
import ESDataStructure

final class OnDemandSubscriber<Input: Sendable>: AsyncSubscriber {
    public let task: Task<(), Error>? = nil
    public let combineIdentifier = CombineIdentifier()
    
    public private(set) var inputs: [Input] = []
    var lastInput: Input? {
        inputs.last
    }
    
    private var onInputReceived: (@MainActor (Input) async -> Void)?
    
    public init() {}
    
    public func receive(subscription: Subscription) {
        subscription.request(.unlimited)
    }
    
    public func receive(_ input: Input) -> Subscribers.Demand {
        inputs.append(input)
        return .unlimited
    }
    
    public func asyncOn(inputReceived: @MainActor @escaping (Input) async -> Void) -> Self {
        onInputReceived = inputReceived
        return self
    }
    
    public func receive(completion: Subscribers.Completion<Never>) {
        // no-op since we have `Never` failure type
    }
    
    @MainActor
    public func receiveInput() async {
        if let lastInput {
            await onInputReceived?(lastInput)
        }
    }
}

