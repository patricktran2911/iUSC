import Foundation

public extension Optional where Wrapped == Date {
    func unwrappedFallbackToNowAnchor(at anchorTime: AnchorTime) -> Date {
        switch self {
        case .none:
            return anchorTime.now
        case .some(let wrapped):
            return wrapped
        }
    }
}
