import Foundation

final class MultipleDepsComponent {
    
    struct InternalData {
        let callSite: String
    }
    
    private let noDepComponent: NoDepComponent
    private let singleDepComponent: SingleDepComponent
    
    convenience init(with resolver: TestingResolver, data: InternalData) {
        self.init(
            noDepComponent: resolver.noDepComponent.resolved(),
            singleDepComponent: resolver.singleDepComponent.resolved(),
            data: data
        )
    }
    
    init(noDepComponent: NoDepComponent, singleDepComponent: SingleDepComponent, data: InternalData) {
        self.noDepComponent = noDepComponent
        self.singleDepComponent = singleDepComponent
    }
}
