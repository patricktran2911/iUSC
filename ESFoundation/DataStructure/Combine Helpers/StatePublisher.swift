import Combine

public struct StatePublisher<T>: @unchecked Sendable {
    public let publisher: CurrentValueSubject<T, Never>
    
    var currentValue: T {
        publisher.value
    }
    
    public init(_ initialValue: T) {
        self.publisher = .init(initialValue)
    }
    
    public func update(value: T) {
        publisher.value = value
    }
}
