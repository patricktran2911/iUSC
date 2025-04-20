import Foundation

public enum InjectedLifeCycle<Param, T> {
    case factory((Param) -> T)
    case singleton((Param) -> T)
}

public final class Injected<Param, T>: Injectable {
    
    private let lifeCycle: InjectedLifeCycle<Param, T>
    private var longLivedValue: T?
    
    public init(as returnedType: T.Type = T.self, _ lifeCycle: InjectedLifeCycle<Param, T>) {
        self.lifeCycle = lifeCycle
    }
    
    public func resolved(with param: Param) -> T {
        switch lifeCycle {
        case .factory(let create):
            return create(param)
            
        case .singleton(let create):
            if let longLivedValue { return longLivedValue }
            let newValue = create(param)
            longLivedValue = newValue
            return newValue
        }
    }
}

// MARK: - Syntactic Sugar

@propertyWrapper
public struct _Injected<Param, T> {
    public let returnedType: T.Type
    public var wrappedValue: any Injectable<Param, T>
    
    public init(wrappedValue: any Injectable<Param, T>, as returnedType: T.Type = T.self) {
        self.wrappedValue = wrappedValue
        self.returnedType = returnedType
    }
    
    public init(as returnedType: T.Type = T.self, _ lifeCycle: InjectedLifeCycle<Param, T>) {
        self.init(wrappedValue: Injected(as: returnedType, lifeCycle), as: returnedType)
    }
    
    public init(as returnedType: T.Type = T.self, required param: Param.Type) {
        self.init(wrappedValue: InjectionRequired(with: param), as: returnedType)
    }
}
