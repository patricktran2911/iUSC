import Foundation
import ESDataStructure

public extension Identifier {
    struct FlashCard: Modelable {
        public let id: String
    }
}

public extension Identifier.FlashCard {
    static var randomGenerated: Self {
        .init(id: UniqueHash.hashableUUID)
    }
    
    static func fromUserNotification(_ identifier: String) -> Self {
        .init(id: identifier)
    }
}
