import SwiftUI

public extension Color.ESBackground {
    
    var color: Color {
        switch self {
        case .screen: Color(.colorNeutral300)
        case .accented: Color(.colorGreen400).opacity(0.1)
        }
    }
}

