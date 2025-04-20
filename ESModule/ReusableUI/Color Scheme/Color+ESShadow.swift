import SwiftUI

public extension Color.ESShadow {
    
    var color: Color {
        switch self {
        case .neutral: Color(.colorNeutral200)
        case .dark: Color(.colorNeutral300)
        }
    }
}
