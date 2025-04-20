import Foundation

final class SingleDepComponent {
    
    private let noDepComponent: NoDepComponent
    
    convenience init(with resolver: TestingResolver) {
        self.init(noDepComponent: resolver.noDepComponent.resolved())
    }
    
    init(noDepComponent: NoDepComponent) {
        self.noDepComponent = noDepComponent
    }
}
