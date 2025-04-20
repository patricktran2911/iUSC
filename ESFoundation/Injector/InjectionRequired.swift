import Foundation

final class InjectionRequired<Param, T>: Injectable {
    init(with param: Param.Type) {}
    
    func resolved(with param: Param) -> T {
        fatalError("No injection found for \(T.self) with param \(Param.self)")
    }
}
