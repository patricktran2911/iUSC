import Combine
import Foundation
import ESLiveData
import ESDataModel
import ESDataSource

public final class ESLanguageMenuViewModel: StreamViewModel<ESLanguageMenuView> {
    public struct LanguageItem: Modelable {
        public let id: DataState.AppLanguage
        public let language: DataState.AppLanguage
        public let hasPurchased: Bool
        
        public init(language: DataState.AppLanguage, hasPurchased: Bool) {
            self.id = language.id
            self.language = language
            self.hasPurchased = hasPurchased
        }
    }
    
    @MainActor
    public init(dataSource: AppPurchasedDataSource) {
        let allLanguagesSupported = CurrentValueSubject<[LanguageItem], Never>(.currentSupportedLanguages)
        let combinedPublishser = Publishers.CombineLatest3(
            allLanguagesSupported,
            dataSource.currentLocale,
            dataSource.currentAvailableLanguagesPublisher
        )
        super.init(
            dataViewPublisher: combinedPublishser
                .map { languages, currentLocale, availableLanguages in
                    var updatedLanguages: [LanguageItem] = languages
                    availableLanguages.forEach { availLang in
                        updatedLanguages = updatedLanguages.updatingPurchasedLanguage(language: availLang)
                    }
                    return (updatedLanguages, currentLocale)
                }
                .map { updatedLanguages, currentLocale in
                    var selectedLanguage: LanguageItem {
                        let currentLanguage = DataState.AppLanguage(rawValue: currentLocale.identifier) ?? .english
                        return updatedLanguages.first(where: {$0.language == currentLanguage}) ?? .init(language: .english, hasPurchased: true)
                    }
                    
                    return ESLanguageMenuView(
                        languages: updatedLanguages,
                        selectedLanguage: .onUpdated(
                            fromInitial: selectedLanguage,
                            action: { newValue in
                                dataSource.selectAppLanguage(newValue.language)
                            }
                        ),
                        unlockAction: .performing {
                            await dataSource.purchaseProduct(id: "iUSC.language.vi")
                        }
                    )
                }
                .eraseToAnyPublisher()
        )
    }
}

extension ESLanguageMenuViewModel.LanguageItem {
    func updating(hasPurchased: Bool) -> Self {
        .init(language: language, hasPurchased: hasPurchased)
    }
    
    public var displayName: String {
        Locale(identifier: language.rawValue)
            .localizedString(forLanguageCode: language.rawValue)?
            .capitalized(with: Locale.current) ?? language.rawValue
    }
}

extension ESLanguageMenuViewModel.LanguageItem: Equatable {
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}

extension Array where Element == ESLanguageMenuViewModel.LanguageItem {
    static let currentSupportedLanguages: [ESLanguageMenuViewModel.LanguageItem] = DataState.AppLanguage.allCases.map {
        .init(language: $0, hasPurchased: $0.id == "en")
    }
    
    func updatingPurchasedLanguage(language: DataState.AppLanguage) -> Self {
        self.map {
            $0.language == language ? $0.updating(hasPurchased: true) : $0
        }
    }
}
