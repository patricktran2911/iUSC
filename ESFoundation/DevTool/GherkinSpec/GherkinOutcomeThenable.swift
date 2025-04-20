import Foundation

public protocol GherkinOutcomeThenable: GherkinContextProvider { }

public extension GherkinOutcomeThenable {
    
    @discardableResult
    func then(
        _ assert: (GherkinSpec.Outcome<Context, Void>) throws -> Void
    ) rethrows -> ThenOutcome<Context> {
        
        let outcome = GherkinSpec.Outcome(context: context, value: ())
        try assert(outcome)
        return .init(context: outcome)
    }
}
