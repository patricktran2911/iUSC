import AuthenticationServices

import ESLiveData
import ESDataModel
import ESDataSource

public final class ESAppleSignInButtonViewModel: SingleViewModel<ESAppleSignInButton> {
    public init(authDataSource: AuthDataSource) {
        super.init {
            ESAppleSignInButton(
                status: .required,
                successAction: .onChanged(fromInitial: nil) { _, updatedAuthorization in
                    if let passwordCredential = updatedAuthorization?.credential as? ASPasswordCredential {
                        authDataSource.updateAuthState(
                            .authenticated(.appleSignIn(account: passwordCredential.user))
                        )
                    } else if let appleIdCredential = updatedAuthorization?.credential as? ASAuthorizationAppleIDCredential {
                        authDataSource.updateAuthState(
                            .authenticated(.appleSignIn(account: appleIdCredential.user))
                        )
                    }
                },
                errorState: .onChanged(fromInitial: nil) { _, error in
                    
                }
            )
        }
    }
}
