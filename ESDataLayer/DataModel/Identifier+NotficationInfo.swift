import Foundation
import ESDataStructure

public extension Identifier {
    struct NotificationInfo: Modelable {
        public let key: String
    }
}

public extension Identifier.NotificationInfo {
    
    // MARK: General
    
    static var referenceNotificationId: Self { .init(key: #function) }
    
    // MARK: - Extended Data
    
    static var nonExpiring: Self { .init(key: #function) }
    
    static var requestTimeInterval: Self { .init(key: #function) }
    
    static var passedReminderTimeInterval: Self { .init(key: #function) }
    
    static var memoCompletion: Self { .init(key: #function) }
}
