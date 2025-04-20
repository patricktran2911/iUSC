import Foundation
import Combine

public final class LatestValueRecorder<T> {
    @Published public private(set) var currentValue: T?
    public private(set) var valueCount = 0
    
    public init(publisher: AnyPublisher<T, Never>) {
        publisher
            .map { [weak self] value -> T? in
                self?.valueCount += 1
                return value
            }
            .assign(to: &$currentValue)
    }
}

public extension Publisher where Failure == Never {
    var latestValueRecorder: LatestValueRecorder<Output> {
        .init(publisher: self.eraseToAnyPublisher())
    }
}
