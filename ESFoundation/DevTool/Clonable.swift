public protocol Clonable {}

public extension Clonable {
    func clone(_ update: (inout Self) -> Void) -> Self {
        var mutatingSelf = self
        update(&mutatingSelf)
        return mutatingSelf
    }
}
