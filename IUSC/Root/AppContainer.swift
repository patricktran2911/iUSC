import Foundation
import ESInjector
import ESDataStructure
import ESDataModel
import ESDataSource
import ESLocalNotification
import ESLogin
import ESFlashCard
import ESPracticeMode
import ESAppPurchased
import ESUSCDataRepository

final class AppContainer {
    
    // MARK: - Containers
    
    lazy var loginContainer = Injected(.singleton {
        LoginContainer()
    })
    
    lazy var fcContainer = Injected(.singleton { [anchorTime, uscDataRepository] in
        let container = FCContainer()
        container.anchorTime = anchorTime
        container.uscDataRepository = uscDataRepository
        return container
    })
    
    lazy var pmContainer = Injected(.singleton { [anchorTime, uscDataRepository] in
        let container = PMContainer()
        container.anchorTime = anchorTime
        container.uscDataRepository = uscDataRepository
        return container
    })
    
    // MARK: - ESLogin
    
    @MainActor
    lazy var authDataSource = Injected(.singleton { [loginContainer] in
        loginContainer.resolved().authDataSource.resolved()
    })
    
    // MARK: - Data
    public lazy var uscDataRepository = Injected(.singleton {
        USCDataRepository()
    })
    
    // MARK: - In-App Purchase
    @MainActor
    lazy var appPurchasedRepository = Injected(as: AppPurchasedDataSource.self, .singleton {
        AppPurchaseRepository()
    })
    
    // MARK: - App
    
    lazy var anchorTime = Injected(.factory {
        AnchorTime.realTime
    })
    
    lazy var appPersistence = Injected(.singleton {
        AppPersistence()
    })
}
