import Foundation

struct StructComponent: ProtocolComponent {
    let identifier: String
    
    init(identifier: String = UUID().uuidString) {
        self.identifier = identifier
    }
}
