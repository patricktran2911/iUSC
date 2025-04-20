import XCTest
import ESFoundationDevTool
import ESInjector

final class NestedInjectionTests: XCTestCase {

    @MainActor
    func testIt_resolvesFullNestedStructure() {
        TestingResolver.given()
            .when { context in
                context.depConsumerComponent.resolved()
            }
            .then { outcome in
                _ = outcome.value
            }
    }

}
