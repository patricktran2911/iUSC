import Foundation

public extension Date {
    func timeIntervalSinceNow(at anchorTime: AnchorTime) -> TimeInterval {
        timeIntervalSince(anchorTime.now)
    }
    
    func timeIntervalSinceTomorrow(at anchorTime: AnchorTime) -> TimeInterval {
        timeIntervalSince(anchorTime.firstHourTomorrow())
    }
}

public extension Date {
    static func goingBack(_ timeInterval: TimeInterval, anchorTime: AnchorTime) -> Self {
        anchorTime.now.addingTimeInterval(-timeInterval)
    }
    
    static func inTheNext(_ timeInterval: TimeInterval, anchorTime: AnchorTime) -> Self {
        anchorTime.now.addingTimeInterval(timeInterval)
    }
    
    static func firstHourTomorrow(andAdding timeInterval: TimeInterval = 0, anchorTime: AnchorTime) -> Self {
        anchorTime.firstHourTomorrow().addingTimeInterval(timeInterval)
    }
}
