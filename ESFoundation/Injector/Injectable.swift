import Foundation

public protocol Injectable<Param, Dep>: AnyObject {
    associatedtype Param
    associatedtype Dep
    
    func resolved(with param: Param) -> Dep
}

public extension Injectable where Param == Void {
    func resolved() -> Dep {
        resolved(with: ())
    }
}
