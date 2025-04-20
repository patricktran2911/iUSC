import Foundation

public protocol GherkinContextPrevalidatable: GherkinContextProvider {}

public extension GherkinContextPrevalidatable {
    func preValidate(
        fileID: StaticString = #fileID,
        line: UInt = #line,
        _ validate: (Context) throws -> Bool
    ) throws -> PrevalidateContext<Context> {
            
        return try .init(context: context, fileID: fileID, line: line, assert: validate)
    }
}
