import Foundation

// MARK: - Typealias

public typealias GivenContext<Context>          = GherkinSpec.Given<Context>
public typealias PrevalidateContext<Context>    = GherkinSpec.Prevalidation<Context>
public typealias WhenOutcome<Outcome, Value>    = GherkinSpec.When<GherkinSpec.Outcome<Outcome, Value>>
public typealias AndWhenOutcome<Outcome>        = GherkinSpec.When<Outcome>
public typealias ThenOutcome<Outcome>           = GherkinSpec.Then<GherkinSpec.Outcome<Outcome, Void>>

// MARK: - Gherkin Sequence

/// The protocol conformation of each steps describes the next step that it can proceed to.
/// E.g. from `Given` we can proceed to either `When`, `Prevalidation` or `Then`
/// but from `When` we can only proceed to `Then`
public enum GherkinSpec {
    
    public struct Given<Context>: GherkinOutcomeWhenable, GherkinContextPrevalidatable, GherkinOutcomeThenable {
        public let context: Context
    }
    
    public struct When<Context>: GherkinContextThenable, GherkinOutcomeAndWhenable {
        public let context: Context
    }
    
    public struct Then<Context>: GherkinContextThenable {
        public let context: Context
    }
}

// MARK: - Outcome

extension GherkinSpec {
    
    /// Capture the outcome of the test without performing any assertion
    /// The `.then` clause will need to perform assertion on this outcome.
    public struct Outcome<Context, Value> {
        
        /// The context of the test, created by the `.given` clause
        ///
        /// This holds the subject under test (aka. sut) and any neccessary dependencies / data that is needed to perform the test
        /// In the case where we are testing a single component, this context is the `sut` itself
        public let context: Context
        
        /// The value returned by the `.when` clause
        ///
        /// This will be `Void` if the `.when` clause only perform the side effect without returning any value,
        /// This will also be `Void` if the test go directly from `.given` -> `.then`
        /// in those cases you most likely will assert based on state changed to the `context`
        public let value: Value
        
        public init(context: Context, value: Value) {
            self.context = context
            self.value = value
        }
    }
}

// MARK: - Prevalidation

extension GherkinSpec {

    /// Prevalidating the context before proceeding
    ///
    /// This is not part of the GherkinSpec
    /// But we extend this to allow throwing and escaping the test early if there are prevalidation failures.
    public struct Prevalidation<Context>: GherkinOutcomeWhenable, GherkinContextPrevalidatable {
        public let context: Context
        
        init(context: Context, 
             fileID: StaticString,
             line: UInt,
             assert: (Context) throws -> Bool
        ) throws {
            
            if try assert(context) == false  {
                throw PrevalidationError.failed(fileID: fileID, line: line)
            }
            
            self.context = context
        }
    }
    
    /// Error thrown when a prevalidation failed
    public enum PrevalidationError: LocalizedError, CustomStringConvertible, CustomDebugStringConvertible {
        case failed(fileID: StaticString, line: UInt)
        
        public var errorDescription: String? {
            switch self {
            case .failed(let fileID, let atLine):
                return "prevalidation failure \(fileID):\(atLine)"
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
