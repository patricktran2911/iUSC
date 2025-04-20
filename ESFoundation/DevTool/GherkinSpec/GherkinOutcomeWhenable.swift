import Foundation

public protocol GherkinOutcomeWhenable: GherkinContextProvider { }

public extension GherkinOutcomeWhenable {
    
    func when<Value>(
        _ perform: (Context) throws -> Value
    ) rethrows -> WhenOutcome<Context, Value> {
        
        let value = try perform(context)
        return .init(context: .init(context: context, value: value))
    }
    
    @MainActor
    func when<Value: Sendable>(
        _ perform: @MainActor (Context) async throws -> Value
    ) async rethrows -> WhenOutcome<Context, Value> {
        
        let value = try await perform(context)
        return .init(context: .init(context: context, value: value))
    }
}
