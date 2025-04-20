import Foundation

public protocol GherkinContextThenable: GherkinContextProvider { }

public extension GherkinContextThenable {
    @discardableResult
    func then(
        _ assert: (Context) throws -> Void
    ) rethrows -> GherkinSpec.Then<Context> {
        
        try assert(context)
        return .init(context: context)
    }
}
