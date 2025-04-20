import SwiftUI

public extension Color.ESText {
    
    var color: Color {
        switch self {
        case .primary: Color(.colorNeutral900)
        case .secondary: Color(.colorNeutral900).opacity(0.75)
        case .warning: Color(.colorRed400)
        case .placeholder: Color(.colorNeutral400)
        }
    }
}
