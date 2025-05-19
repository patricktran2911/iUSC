import Combine
import ESDataModel
import Foundation

public protocol AppPurchasedDataSource {
    var currentLocale: AnyPublisher<Locale, Never> { get }
    var productsPurchasedPublisher: AnyPublisher<Set<String>, Never> { get }
    var currentAvailableLanguagesPublisher: AnyPublisher<[DataState.AppLanguage], Never> { get }
    
    @MainActor
    func purchaseProduct(id: String) async
    func restorePurchases()
    @MainActor
    func loadPurchaseHistory() async
    func selectAppLanguage(_ language: DataState.AppLanguage)
}
