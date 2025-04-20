import Foundation

public protocol GherkinContextProvider {
    associatedtype Context
    
    var context: Context { get }
}

public extension GherkinContextProvider {
    @MainActor @discardableResult
    func pauseAsync(_ delay: TimeInterval = 0) async -> Self {
        try? await Task.sleep(nanoseconds: UInt64(delay) * 1_000_000_000)
        return self
    }
}
