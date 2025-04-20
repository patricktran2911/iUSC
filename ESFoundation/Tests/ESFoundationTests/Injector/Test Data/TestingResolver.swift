import Foundation
import ESFoundationDevTool
import ESInjector

final class TestingResolver {
    
    @MainActor
    static let given = {
        UnitTest.given {
            TestingResolver()
        }
    }
    
    // MARK: - Struct
    
    @_Injected(.factory { StructComponent() })
    var factoryStruct
    
    @_Injected(.singleton { StructComponent() })
    var singletonStruct
    
    @_Injected(.factory { StructComponent(identifier: $0) })
    var parametizedFactoryStruct
    
    @_Injected(.singleton { StructComponent(identifier: $0) })
    var parametizedSingletonStruct
    
    @_Injected(as: StructComponent.self, required: Void.self)
    var requiredStruct
    
    @_Injected(as: StructComponent.self, required: String.self)
    var parametizedRequiredStruct
    
    // MARK: - Class
    
    @_Injected(.factory { ClassComponent() })
    var factoryClass
    
    @_Injected(.singleton { ClassComponent() })
    var singletonClass
    
    @_Injected(.factory { ClassComponent(identifier: $0) })
    var parametizedFactoryClass
    
    @_Injected(.singleton { ClassComponent(identifier: $0) })
    var parametizedSingletonClass
    
    @_Injected(as: ClassComponent.self, required: Void.self)
    var requiredClass
    
    @_Injected(as: ClassComponent.self, required: String.self)
    var parametizedRequiredClass
    
    // MARK: - Protocol Struct
    
    @_Injected(as: ProtocolComponent.self, .factory {
        StructComponent()
    })
    var factoryStructProtocol
    
    @_Injected(as: ProtocolComponent.self, .singleton {
        StructComponent()
    }) 
    var singletonStructProtocol
    
    @_Injected(as: ProtocolComponent.self, .factory {
        StructComponent(identifier: $0)
    }) 
    var parametizedFactoryStructProtocol
    
    @_Injected(as: ProtocolComponent.self, .singleton {
        StructComponent(identifier: $0)
    }) 
    var parametizedSingletonStructProtocol
    
    // MARK: - Protocol Class
    
    @_Injected(as: ProtocolComponent.self, .factory {
        StructComponent()
    }) 
    var factoryClassProtocol
    
    @_Injected(as: ProtocolComponent.self, .singleton {
        StructComponent()
    }) 
    var singletonClassProtocol
    
    @_Injected(as: ProtocolComponent.self, .factory {
        StructComponent(identifier: $0)
    }) 
    var parametizedFactoryClassProtocol
    
    @_Injected(as: ProtocolComponent.self, .singleton {
        StructComponent(identifier: $0)
    }) 
    var parametizedSingletonClassProtocol
    
    // MARK: - Protocol Required
    
    @_Injected(as: ProtocolComponent.self, required: Void.self)
    var requiredProtocol
    
    @_Injected(as: ProtocolComponent.self, required: String.self)
    var parametizedRequiredProtocol
    
    // MARK: - Nested Dependencies
    
    lazy var noDepComponent = Injected(.factory {
        NoDepComponent()
    })
    
    lazy var singleDepComponent = Injected(.factory { [unowned self] in
        SingleDepComponent(with: self)
    })
    
    lazy var multipleDepsComponent = Injected(.factory { [unowned self] in
        MultipleDepsComponent(with: self, data: $0)
    })
    
    lazy var depConsumerComponent = Injected(.factory { [unowned self] in
        DepConsumerComponent(with: self)
    })
}
