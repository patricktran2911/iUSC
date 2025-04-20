import XCTest
import ESFoundationDevTool
import ESInjector

final class InjectionRequiredTests: XCTestCase {

    // MARK: - Struct
    
    @MainActor
    func testIt_requiresFactoryStructInjection() {
        let structComponent = StructComponent(identifier: "structId")
        
        TestingResolver.given()
            .when { context in
                context.requiredStruct = Injected(.factory {
                    structComponent
                })
            }
            .then { outcome in
                let result = outcome.context.requiredStruct.resolved()
                XCTAssertEqual(result.identifier, "structId")
            }
    }
    
    @MainActor
    func testIt_requiresSingletonStructInjection() {
        let structComponent = StructComponent(identifier: "structId")
        
        TestingResolver.given()
            .when { context -> [StructComponent] in
                context.requiredStruct = Injected(.singleton {
                    structComponent
                })
                
                return [
                    context.requiredStruct.resolved(),
                    context.requiredStruct.resolved()
                ]
            }
            .then { outcome in
                XCTAssertEqual(outcome.value.first?.identifier, "structId")
            }
            .then { outcome in
                XCTAssertEqual(outcome.value.first?.identifier, outcome.value.last?.identifier)
            }
    }
    
    // MARK: - Class
    
    @MainActor
    func testIt_requiresFactoryClassInjection() {
        let classComponent = ClassComponent(identifier: "classId")
        
        TestingResolver.given()
            .when { context in
                context.requiredClass = Injected(.factory {
                    classComponent
                })
            }
            .then { outcome in
                let result = outcome.context.requiredClass.resolved()
                XCTAssertEqual(result.identifier, "classId")
            }
    }
    
    @MainActor
    func testIt_requiresSingletonClassInjection() {
        let classComponent = ClassComponent(identifier: "classId")
        
        TestingResolver.given()
            .when { context -> [ClassComponent] in
                context.requiredClass = Injected(.singleton {
                    classComponent
                })
                
                return [
                    context.requiredClass.resolved(),
                    context.requiredClass.resolved()
                ]
            }
            .then { outcome in
                XCTAssertEqual(outcome.value.first?.identifier, "classId")
            }
            .then { outcome in
                XCTAssertEqual(outcome.value.first?.identifier, outcome.value.last?.identifier)
            }
    }
    
    // MARK: - Protocol
    
    @MainActor
    func testIt_requiresFactoryProtocolInjection_implementedByStruct() {
        let structComponent = StructComponent(identifier: "structId")
        
        TestingResolver.given()
            .when { context in
                context.requiredProtocol = Injected(.factory {
                    structComponent
                })
            }
            .then { outcome in
                let result = outcome.context.requiredProtocol.resolved()
                XCTAssertEqual(result.identifier, "structId")
            }
    }
    
    @MainActor
    func testIt_requiresSingletonProtocolInjection_implementedByStruct() {
        let structComponent = StructComponent(identifier: "structId")
        
        TestingResolver.given()
            .when { context -> [ProtocolComponent] in
                context.requiredProtocol = Injected(.singleton {
                    structComponent
                })
                
                return [
                    context.requiredProtocol.resolved(),
                    context.requiredProtocol.resolved()
                ]
            }
            .then { outcome in
                XCTAssertEqual(outcome.value.first?.identifier, "structId")
            }
            .then { outcome in
                XCTAssertEqual(outcome.value.first?.identifier, outcome.value.last?.identifier)
            }
    }
    
    @MainActor
    func testIt_requiresFactoryProtocolInjection_implementedByClass() {
        let classComponent = ClassComponent(identifier: "structId")
        
        TestingResolver.given()
            .when { context in
                context.requiredProtocol = Injected(.factory {
                    classComponent
                })
            }
            .then { outcome in
                let result = outcome.context.requiredProtocol.resolved()
                XCTAssertEqual(result.identifier, "structId")
            }
    }
    
    @MainActor
    func testIt_requiresSingletonProtocolInjection_implementedByClass() {
        let classComponent = ClassComponent(identifier: "structId")
        
        TestingResolver.given()
            .when { context -> [ProtocolComponent] in
                context.requiredProtocol = Injected(.singleton {
                    classComponent
                })
                
                return [
                    context.requiredProtocol.resolved(),
                    context.requiredProtocol.resolved()
                ]
            }
            .then { outcome in
                XCTAssertEqual(outcome.value.first?.identifier, "structId")
            }
            .then { outcome in
                XCTAssertEqual(outcome.value.first?.identifier, outcome.value.last?.identifier)
            }
    }
}
