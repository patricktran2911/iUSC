public extension Injected {
    enum InjectionError: Error {
        case noMockProvided
    }
    
    func mockResolved<Mock>(for param: Param) throws -> Mock {
        if let mockedValue = resolved(with: param) as? Mock {
            return mockedValue
        }
        
        throw InjectionError.noMockProvided
    }
}

public extension Injected where Param == Void {
    func mockResolved<Mock>() throws -> Mock {
        if let mockedValue = resolved() as? Mock {
            return mockedValue
        }
        
        throw InjectionError.noMockProvided
    }
}
