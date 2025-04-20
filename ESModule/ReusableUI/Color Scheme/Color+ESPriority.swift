import SwiftUI

public extension Color.ESPriority {
    
    var color: Color {
        switch self {
        case .expired: Color(.colorNeutral500).opacity(0.75)
        case .withinAnHour: Color(.colorRed500)
        case .withinToday: Color(.colorBlue500)
        case .withinTomorrow: Color(.colorGreen500)
        case .futureDay: Color(.colorGreen600)
        }
    }
}
