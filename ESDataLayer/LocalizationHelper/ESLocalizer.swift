import Foundation

public enum ESLocalizer {
    public enum LocalizationTable: String {
        case dataModel = "DataModelLocalizable"
        case flashcard = "FlashcardLocalizable"
        case practiceMode = "PracticeModeLocalable"
        case landing = "LandingLocalizable"
    }
    
    public static let bundle: Bundle = .module

    public static func text(
        _ key: String.LocalizationValue,
        table: LocalizationTable? = nil,
        locale: Locale? = nil
    ) -> String {
        String(localized: key,
               table: table?.rawValue,
               bundle: bundle,
               locale: locale ?? .current)
    }
}
