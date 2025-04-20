import ESLiveData
import ESDataModel
import ESDataSource
import ESAppleSignIn

public final class LoginLandingViewModel: SingleViewModel<LoginLandingView> {
    public init(container: LoginContainer) {
        super.init {
            LoginLandingView(
                signInButton: .viewBuilt(from: ESAppleSignInButtonViewModel(
                    authDataSource: container.authDataSource.resolved())
                )
            )
        }
    }
}
