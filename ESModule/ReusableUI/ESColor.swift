import SwiftUI
import ESDataStructure

public extension Color {
    
    enum ESText: HashIdentifiable {
        /// .neutral900
        case primary
        
        /// .neutral900 @.75
        case secondary
        
        /// .red400
        case warning
        
        /// .neutral400
        case placeholder
    }
    
    enum ESBackground: HashIdentifiable {
        /// .neutralWhite
        case screen
        
        /// .green400 @ .1
        case accented
    }
    
    enum ESShadow: HashIdentifiable {
        /// .neutral200
        case neutral
        
        /// .neutral300
        case dark
    }
    
    enum ESBorder: HashIdentifiable {
        /// .neutral600
        case neutral
    }
    
    enum ESPriority: HashIdentifiable, CaseIterable {
    
        /// .red500
        case withinAnHour
        
        /// .blue500
        case withinToday
        
        /// .green500
        case withinTomorrow
        
        /// .green600
        case futureDay
        
        /// .neutral500 @0.75
        case expired
    }
}
