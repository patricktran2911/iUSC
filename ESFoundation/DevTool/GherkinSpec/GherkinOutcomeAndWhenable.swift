import Foundation

public protocol GherkinOutcomeAndWhenable: GherkinContextProvider { }

public extension GherkinOutcomeAndWhenable {
    func andWhen(
        _ perform: (Context) throws -> Void
    ) rethrows -> AndWhenOutcome<Context> {
        
        try perform(context)
        return .init(context: context)
    }
    
    @MainActor
    func andWhen(
        _ perform: @MainActor (Context) async throws -> Void
    ) async rethrows -> AndWhenOutcome<Context> {
        
        try await perform(context)
        return .init(context: context)
    }
}
