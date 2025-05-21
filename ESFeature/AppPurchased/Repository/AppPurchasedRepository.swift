import ESDataSource
import Combine
import StoreKit
import ESDataModel

public final class AppPurchaseRepository: AppPurchasedDataSource {
    private let userDefault = UserDefaults.standard
    
    public var productsPurchasedPublisher: AnyPublisher<Set<String>, Never> {
        purchased.eraseToAnyPublisher()
    }
    
    public var currentLocale: AnyPublisher<Locale, Never> {
        userDefault.publisher(for: \.appLocale).eraseToAnyPublisher()
    }
    
    public var isOnProcessingPurchases: AnyPublisher<Bool, Never> {
        isProcessingPurchase.eraseToAnyPublisher()
    }
    
    
    public var currentAvailableLanguagesPublisher: AnyPublisher<[DataState.AppLanguage], Never> {
        purchased
            .map { ids in
                if ids.contains(where: { $0 == "iUSC.languages"}) {
                    return DataState.AppLanguage.allCases
                }
                return [.english]
            }
            .eraseToAnyPublisher()
    }

    private var updateTask: Task<Void, Never>?
    private let purchased = CurrentValueSubject<Set<String>, Never>([])
    private let isProcessingPurchase = CurrentValueSubject<Bool, Never>(false)
    
    @MainActor
    public init() {
        updateTask = listenForTransactionUpdates()
    }
    
    @MainActor
    public func purchaseProduct(id: String) async {
        guard !purchased.value.contains(id) else { return }
        
        isProcessingPurchase.value = true
        
        do {
            guard let product = try await Product.products(for: [id]).first else { return }
            let result = try await product.purchase()
            if case .success(let verification) = result,
               case let .verified(tx) = verification {
                add(tx.productID)
            }
        } catch {
            print("Purchase failed:", error)
            isProcessingPurchase.value = false
        }
        isProcessingPurchase.value = false
    }
    
    public func selectAppLanguage(_ language: DataState.AppLanguage) {
        userDefault.appLocale = Locale(identifier: language.id)
    }

    public func restorePurchases() {
        Task {
            try? await AppStore.sync()
        }
    }

    @MainActor
    public func loadPurchaseHistory() async {
        var owned: Set<String> = []
        for await entitlement in Transaction.currentEntitlements {
            if case let .verified(tx) = entitlement { owned.insert(tx.productID) }
        }
        self.set(owned)
    }

    @MainActor
    private func listenForTransactionUpdates() -> Task<Void, Never> {
        Task { [weak self] in
            guard let self = self else { return }
            for await update in Transaction.updates {
                guard case let .verified(tx) = update else { continue }
                self.add(tx.productID)
            }
        }
    }

    private func add(_ id: String) {
        set(
            purchased.value.union(
                [id]
            )
        )
    }

    private func set(_ set: Set<String>) {
        purchased.value = set
    }
}
