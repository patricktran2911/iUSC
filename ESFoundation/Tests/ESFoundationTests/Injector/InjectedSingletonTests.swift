import XCTest
import ESFoundationDevTool
import ESInjector

final class InjectedSingletonTests: XCTestCase {

    // MARK: - Struct
    
    @MainActor
    func testIt_resolvesSameInstance_forStruct() {
        TestingResolver.given()
            .when { context -> [StructComponent] in
                let firstStruct = context.singletonStruct.resolved()
                let secondStruct = context.singletonStruct.resolved()
                return [firstStruct, secondStruct]
            }
            .then { outcome in
                XCTAssertEqual(
                    outcome.value.first?.identifier,
                    outcome.value.last?.identifier
                )
            }
    }
    
    @MainActor
    func testIt_resolvesSameInstance_parametized_forStruct() {
        TestingResolver.given()
            .when { context -> [StructComponent] in
                let firstStruct = context.parametizedSingletonStruct.resolved(with: "SameId")
                let secondStruct = context.parametizedSingletonStruct.resolved(with: "SameId")
                return [firstStruct, secondStruct]
            }
            .then { outcome in
                XCTAssertEqual(outcome.value.first?.identifier, "SameId")
                XCTAssertEqual(outcome.value.last?.identifier, "SameId")
            }
    }
    
    @MainActor
    func testIt_resolvesSameInstance_regardlessOfParam_forStruct() {
        TestingResolver.given()
            .when { context -> [StructComponent] in
                let firstStruct = context.parametizedSingletonStruct.resolved(with: "usedId")
                let secondStruct = context.parametizedSingletonStruct.resolved(with: "ignoredId")
                return [firstStruct, secondStruct]
            }
            .then { outcome in
                XCTAssertEqual(outcome.value.first?.identifier, "usedId")
                XCTAssertEqual(outcome.value.last?.identifier, "usedId")
            }
    }
    
    // MARK: - Class
    
    @MainActor
    func testIt_resolvesSameInstance_forClass() {
        TestingResolver.given()
            .when { context -> [ClassComponent] in
                let firstClass = context.singletonClass.resolved()
                let secondClass = context.singletonClass.resolved()
                return [firstClass, secondClass]
            }
            .then { outcome in
                XCTAssertEqual(
                    outcome.value.first?.identifier,
                    outcome.value.last?.identifier
                )
                
                XCTAssertIdentical(outcome.value.first, outcome.value.last)
            }
    }
    
    @MainActor
    func testIt_resolvesSameInstance_parametized_forClass() {
        TestingResolver.given()
            .when { context -> [ClassComponent] in
                let firstClass = context.parametizedSingletonClass.resolved(with: "SameId")
                let secondClass = context.parametizedSingletonClass.resolved(with: "SameId")
                return [firstClass, secondClass]
            }
            .then { outcome in
                XCTAssertEqual(outcome.value.first?.identifier, "SameId")
                XCTAssertEqual(outcome.value.last?.identifier, "SameId")
                
                XCTAssertIdentical(outcome.value.first, outcome.value.last)
            }
    }
    
    @MainActor
    func testIt_resolvesSameInstance_regardlessOfParam_forClass() {
        TestingResolver.given()
            .when { context -> [ClassComponent] in
                let firstClass = context.parametizedSingletonClass.resolved(with: "usedId")
                let secondClass = context.parametizedSingletonClass.resolved(with: "ignoredId")
                return [firstClass, secondClass]
            }
            .then { outcome in
                XCTAssertEqual(outcome.value.first?.identifier, "usedId")
                XCTAssertEqual(outcome.value.last?.identifier, "usedId")
                
                XCTAssertIdentical(outcome.value.first, outcome.value.last)
            }
    }
    
    // MARK: - Protocol implemented by Struct
    
    @MainActor
    func testIt_resolvesSameInstance_forStructProtocol() {
        TestingResolver.given()
            .when { context -> [ProtocolComponent] in
                let firstStruct = context.singletonStructProtocol.resolved()
                let secondStruct = context.singletonStructProtocol.resolved()
                return [firstStruct, secondStruct]
            }
            .then { outcome in
                XCTAssertEqual(
                    outcome.value.first?.identifier,
                    outcome.value.last?.identifier
                )
            }
    }
    
    @MainActor
    func testIt_resolvesSameInstance_parametized_forStructProtocol() {
        TestingResolver.given()
            .when { context -> [ProtocolComponent] in
                let firstStruct = context.parametizedSingletonStructProtocol.resolved(with: "SameId")
                let secondStruct = context.parametizedSingletonStructProtocol.resolved(with: "SameId")
                return [firstStruct, secondStruct]
            }
            .then { outcome in
                XCTAssertEqual(outcome.value.first?.identifier, "SameId")
                XCTAssertEqual(outcome.value.last?.identifier, "SameId")
            }
    }
    
    @MainActor
    func testIt_resolvesSameInstance_regardlessOfParam_forStructProtocol() {
        TestingResolver.given()
            .when { context -> [ProtocolComponent] in
                let firstStruct = context.parametizedSingletonStructProtocol.resolved(with: "usedId")
                let secondStruct = context.parametizedSingletonStructProtocol.resolved(with: "ignoredId")
                return [firstStruct, secondStruct]
            }
            .then { outcome in
                XCTAssertEqual(outcome.value.first?.identifier, "usedId")
                XCTAssertEqual(outcome.value.last?.identifier, "usedId")
            }
    }
    
    // MARK: - Protocol implemented by Class
    
    @MainActor
    func testIt_resolvesSameInstance_forClassProtocol() {
        TestingResolver.given()
            .when { context -> [ProtocolComponent] in
                let firstClass = context.singletonClassProtocol.resolved()
                let secondClass = context.singletonClassProtocol.resolved()
                return [firstClass, secondClass]
            }
            .then { outcome in
                XCTAssertEqual(
                    outcome.value.first?.identifier,
                    outcome.value.last?.identifier
                )
            }
    }
    
    @MainActor
    func testIt_resolvesSameInstance_parametized_forClassProtocol() {
        TestingResolver.given()
            .when { context -> [ProtocolComponent] in
                let firstClass = context.parametizedSingletonClassProtocol.resolved(with: "SameId")
                let secondClass = context.parametizedSingletonClassProtocol.resolved(with: "SameId")
                return [firstClass, secondClass]
            }
            .then { outcome in
                XCTAssertEqual(outcome.value.first?.identifier, "SameId")
                XCTAssertEqual(outcome.value.last?.identifier, "SameId")
            }
    }
    
    @MainActor
    func testIt_resolvesSameInstance_regardlessOfParam_forClassProtocol() {
        TestingResolver.given()
            .when { context -> [ProtocolComponent] in
                let firstClass = context.parametizedSingletonClassProtocol.resolved(with: "usedId")
                let secondClass = context.parametizedSingletonClassProtocol.resolved(with: "ignoredId")
                return [firstClass, secondClass]
            }
            .then { outcome in
                XCTAssertEqual(outcome.value.first?.identifier, "usedId")
                XCTAssertEqual(outcome.value.last?.identifier, "usedId")
            }
    }
}
