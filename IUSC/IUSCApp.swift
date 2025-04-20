import SwiftUI

@main
struct iUSCApp: App {
    let app = AppContainer()
    
    var body: some Scene {
        WindowGroup {
            USCLandingView.viewObserved(stream: USCLandingViewModel(container: app))
        }
    }
}
