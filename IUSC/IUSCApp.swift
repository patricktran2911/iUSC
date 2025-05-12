import SwiftUI
import FirebaseCore
import FirebaseRemoteConfig

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        let remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 3600 * 24
        remoteConfig.configSettings = settings
        remoteConfig.setDefaults(fromPlist: "remote_config_defaults")
        return true
    }
}

@main
struct iUSCApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    let app = AppContainer()
    
    var body: some Scene {
        WindowGroup {
            USCLandingView.viewObserved(stream: USCLandingViewModel(container: app))
        }
    }
}
