import Foundation

public extension Double {
    var seconds: Self { self }
    var minutes: Self { 60 * seconds }
    var hours: Self { 60 * minutes }
    var days: Self { 24 * hours }
    var weeks: Self { 7 * days }
    var years: Self { 365 * days }
    
    
    func makeDate(anchorTime: AnchorTime) -> Date {
        anchorTime.now.addingTimeInterval(self)
    }
}
