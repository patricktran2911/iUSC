import XCTest
import ESFoundationDevTool
import ESInjector

final class InjectedFactoryTests: XCTestCase {
    
    @MainActor
    func testIt_resolvesDifferentInstance_forStruct() {
        TestingResolver.given()
            .when { context -> [StructComponent] in
                let firstStruct = context.factoryStruct.resolved()
                let secondStruct = context.factoryStruct.resolved()
                return [firstStruct, secondStruct]
            }
            .then { outcome in
                XCTAssertNotEqual(
                    outcome.value.first?.identifier,
                    outcome.value.last?.identifier
                )
            }
    }
    
    @MainActor
    func testIt_resolvesDifferentInstance_forClass() {
        TestingResolver.given()
            .when { context -> [ClassComponent] in
                let firstClass = context.factoryClass.resolved()
                let secondClass = context.factoryClass.resolved()
                return [firstClass, secondClass]
            }
            .then { outcome in
                XCTAssertNotEqual(
                    outcome.value.first?.identifier,
                    outcome.value.last?.identifier
                )
                
                XCTAssertNotIdentical(outcome.value.first, outcome.value.last)
            }
    }
    
    @MainActor
    func testIt_resolvesDifferentInstance_forStructProtocol() {
        TestingResolver.given()
            .when { context -> [ProtocolComponent] in
                let firstStruct = context.factoryStructProtocol.resolved()
                let secondStruct = context.factoryStructProtocol.resolved()
                return [firstStruct, secondStruct]
            }
            .then { outcome in
                XCTAssertNotEqual(
                    outcome.value.first?.identifier,
                    outcome.value.last?.identifier
                )
            }
    }
    
    @MainActor
    func testIt_resolvesDifferentInstance_forClassProtocol() {
        TestingResolver.given()
            .when { context -> [ProtocolComponent] in
                let firstClass = context.factoryClassProtocol.resolved()
                let secondClass = context.factoryClassProtocol.resolved()
                return [firstClass, secondClass]
            }
            .then { outcome in
                XCTAssertNotEqual(
                    outcome.value.first?.identifier,
                    outcome.value.last?.identifier
                )
            }
    }
}
