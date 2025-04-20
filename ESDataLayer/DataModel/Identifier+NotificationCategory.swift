import Foundation
import ESDataStructure

public extension Identifier {
    struct NotificationCategory: Codable, Sendable, HashIdentifiable {
        public let id: String
    }
}

public extension Identifier.NotificationCategory {
    static var memoReminder: Self { .init(id: #function) }
}
