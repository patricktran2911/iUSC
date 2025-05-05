import Foundation
import ESInjector
import ESDataStructure
import ESDataModel
import ESDataSource
import ESLocalNotification
import ESLogin
import ESFlashCard
import ESPracticeMode

final class AppContainer {
    
    // MARK: - Containers
    
    lazy var loginContainer = Injected(.singleton {
        LoginContainer()
    })
    
    lazy var fcContainer = Injected(.singleton { [anchorTime] in
        let container = FCContainer()
        container.anchorTime = anchorTime
        return container
    })
    
    lazy var pmContainer = Injected(.singleton { [anchorTime] in
        let container = PMContainer()
        container.anchorTime = anchorTime
        return container
    })
    
    // MARK: - ESLogin
    
    lazy var authDataSource = Injected(.singleton { [loginContainer] in
        loginContainer.resolved().authDataSource.resolved()
    })
    
    // MARK: - App
    
    lazy var anchorTime = Injected(.factory {
        AnchorTime.realTime
    })
    
    lazy var appPersistence = Injected(.singleton {
        AppPersistence()
    })
}
