import ESInjector
import ESLiveData
import ESDataSource
import ESAppleSignIn

public final class LoginContainer {
    public init() {}
                                             
    public lazy var authDataSource = Injected(as: AuthDataSource.self, .singleton {
        AuthenticationRepository()
    })
}

