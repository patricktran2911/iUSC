import Foundation

public struct AnchorTime: HashIdentifiable, Sendable {
    
    /// The reference to `now`
    public let now: Date
    
    /// The reference to current calendar
    public let calendar: Calendar
    
    /// The reference to current timezone
    public let timeZone: TimeZone
}

public extension AnchorTime {
    static var realTime: Self {
        .init(now: .now, calendar: .current, timeZone: .current)
    }
    
    static func goingBack(_ timeInterval: TimeInterval) -> Self {
        .init(
            now: .goingBack(timeInterval, anchorTime: .realTime),
            calendar: .current,
            timeZone: .current
        )
    }
    
    static func inTheNext(_ timeInterval: TimeInterval) -> Self {
        .init(
            now: .inTheNext(timeInterval, anchorTime: .realTime),
            calendar: .current,
            timeZone: .current
        )
    }
}

public extension AnchorTime {
    func isWithinToday(afterAdding timeInterval: TimeInterval) -> Bool {
        calendar.isDateInToday(now.addingTimeInterval(timeInterval))
    }
    
    func isWithinTomorrow(afterAdding timeInterval: TimeInterval) -> Bool {
        calendar.isDateInTomorrow(now.addingTimeInterval(timeInterval))
    }
    
    func firstHourTomorrow() -> Date {
        let incremental: TimeInterval = 1.hours
        var currentTimeCheck = now
        while calendar.isDateInToday(currentTimeCheck) {
            currentTimeCheck.addTimeInterval(incremental)
        }
        
        return currentTimeCheck
    }
}
