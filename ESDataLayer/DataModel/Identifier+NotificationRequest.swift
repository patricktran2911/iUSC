import Foundation
import ESDataStructure

public extension Identifier {
    struct NotificationRequest: Codable, Sendable, HashIdentifiable {
        public let id: String
    }
}
