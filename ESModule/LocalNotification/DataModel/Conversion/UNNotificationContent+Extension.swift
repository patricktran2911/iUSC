import UserNotifications
import ESDataModel

extension UNMutableNotificationContent {
    func setInfo<Value>(_ value: Value, for infoIdentifier: Identifier.NotificationInfo) {
        userInfo[infoIdentifier.key] = value
    }
}

extension UNNotificationContent {
    func info<Value>(for infoIdentifier: Identifier.NotificationInfo) -> Value? {
        userInfo[infoIdentifier.key] as? Value
    }
}
