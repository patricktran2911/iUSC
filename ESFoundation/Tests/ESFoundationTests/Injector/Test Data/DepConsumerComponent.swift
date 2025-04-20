import Foundation

final class DepConsumerComponent {
    private let multipleDepsComponent: MultipleDepsComponent
    
    convenience init(with resolver: TestingResolver) {
        self.init(
            multipleDepsComponent: resolver.multipleDepsComponent.resolved(with: .init(
                callSite: "DataCompositeComponent"
            ))
        )
    }
    
    init(multipleDepsComponent: MultipleDepsComponent) {
        self.multipleDepsComponent = multipleDepsComponent
    }
}
