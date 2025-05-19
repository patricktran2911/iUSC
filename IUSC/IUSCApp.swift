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
    @AppStorage(UserDefaults.appLocaleKey) var appLocale: String?
    let app = AppContainer()
    
    var body: some Scene {
        WindowGroup {
            USCLandingView.viewObserved(stream: USCLandingViewModel(container: app))
                .environment(\.locale, UserDefaults.standard.appLocale)
                .id(appLocale)
        }
    }
}
