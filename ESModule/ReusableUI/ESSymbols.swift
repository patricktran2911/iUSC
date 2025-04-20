import Foundation

public extension String {
    /// There are opensource project that includes all symbols in enum form
    /// like https://github.com/jollyjinx/SFSymbolEnum
    ///
    /// However, large enum cases will cause performance issue in prod and random crash
    /// So this should only limited to symbols we actually use
    ///
    /// Cases should be alphabetical arranged
    enum ESSymbols: String {
        
        case arrow_up_circle_fill = "arrow.up.circle.fill"
        
        case calendar_circle_fill = "calendar.circle.fill"
        
        case chevron_right = "chevron.right"
        
        case clock_fill = "clock.fill"
        
        case plus_circle_fill = "plus.circle.fill"
        
        case waveform = "waveform"
        
        case xmark = "xmark"
        
        /// rawValue
        public var name: String {
            rawValue
        }
    }
}

