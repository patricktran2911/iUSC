import Foundation
import ESDataStructure

public enum ESLocalizer {
    public enum LocalizationTable: String {
        case dataModel = "DataModelLocalizable"
        case flashcard = "FlashcardLocalizable"
        case practiceMode = "PracticeModeLocalizable"
        case landing = "LandingLocalizable"
    }

    public static func text(
        _ key: String.LocalizationValue,
        table: LocalizationTable? = nil,
    ) -> String {
        var bundle: Bundle = .module
        let localeID = UserDefaults.standard.string(forKey: "AppLocale") ?? "en"
        let path = bundle.path(forResource: localeID, ofType: "lproj")
        bundle = Bundle(path: path ?? "") ?? bundle
        return String(localized: key,
                      table: table?.rawValue,
                      bundle: bundle)
    }
}


// Featurea
//   USCISLocalization
//      - ESLocalizer
//      - FlashcardLocalizable
//      - PracticeModeLocalizable
//   FlashCard
//   PracticeMode
