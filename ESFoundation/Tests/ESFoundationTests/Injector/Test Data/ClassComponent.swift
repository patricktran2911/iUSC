import Foundation

final class ClassComponent: ProtocolComponent {
    let identifier: String
    
    init(identifier: String = UUID().uuidString) {
        self.identifier = identifier
    }
}
