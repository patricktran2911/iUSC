import Foundation

extension GherkinSpec {
    
    public final class LeakCheck<T: AnyObject> {
        private weak var weakReference: T?
        
        init(weakReference: T) {
            self.weakReference = weakReference
        }
        
        public func assertNoLeak(fileID: StaticString = #fileID,
                          line: UInt = #line) throws {
            if weakReference != nil {
                throw MemoryLeakError.leaked(fileID: fileID, line: line, type: "\(T.self)")
            }
        }
    }
    
    public enum MemoryLeakError: LocalizedError, CustomStringConvertible, CustomDebugStringConvertible {
        case leaked(fileID: StaticString, line: UInt, type: String)
        
        public var errorDescription: String? {
            switch self {
            case let .leaked(fileID, atLine, type):
                return "memory leak for \(type), \(fileID):\(atLine)"
            }
        }
        
        public var failureReason: String? {
            errorDescription
        }
        
        public var description: String {
            errorDescription ?? ""
        }
        
        public var debugDescription: String {
            errorDescription ?? ""
        }
    }
}

// MARK: - Extending GherkinSpec

public protocol GherkinMemoryMetric: GherkinContextProvider {}

public extension GherkinMemoryMetric {
    func deallocate<T>(_ keyPath: KeyPath<Context, T>) -> GherkinSpec.LeakCheck<T> {
        .init(weakReference: context[keyPath: keyPath])
    }
}

extension GherkinSpec.Prevalidation: GherkinMemoryMetric {}
extension GherkinSpec.When: GherkinMemoryMetric {}
extension GherkinSpec.Then: GherkinMemoryMetric {}
extension GherkinSpec.Given {
    public func deallocate<T>(_ keyPath: KeyPath<GherkinSpec.Outcome<Context, Void>, T>) -> GherkinSpec.LeakCheck<T> {
        let outcome = GherkinSpec.Outcome<Context, Void>(context: context, value: ())
        return .init(weakReference: outcome[keyPath: keyPath])
    }
}
