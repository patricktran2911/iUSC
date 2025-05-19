import ESLiveData
import ESDataModel
import ESDataSource
import ESAppleSignIn
import ESLocalizer

public final class LoginLandingViewModel: SingleViewModel<LoginLandingView> {
    @MainActor
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
