import ESDataStructure
import Foundation

extension DataState {
    public enum AppLanguage: String, CaseIterable, Modelable {
        case english = "en"
        case vietnamese = "vi"
        
        public var id: String {
            rawValue
        }
    }
}
