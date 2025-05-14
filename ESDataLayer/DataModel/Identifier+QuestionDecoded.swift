import Foundation
import ESDataStructure

extension Identifier {
    public struct QuestionDecoded: Modelable {
        public let id: String
    }
}

public extension Identifier.QuestionDecoded {
    static var randomGenerated: Self {
        .init(id: UniqueHash.hashableUUID)
    }
    
    static func fromUserNotification(_ identifier: String) -> Self {
        .init(id: identifier)
    }
}
