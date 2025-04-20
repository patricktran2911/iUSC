import Foundation
import SwiftUI
import AuthenticationServices
import ESDataStructure
import ESLiveData

public struct ESAppleSignInButton: HashIdentifiable {
    enum AuthorizationStatus: HashIdentifiable {
        case notRequired
        case required
    }
    
    enum AuthorizationError: HashIdentifiable {
        case generic
    }
    
    let status: AuthorizationStatus
    let successAction: ValueChangedEffect<ASAuthorization?>
    let errorState: ValueChangedEffect<AuthorizationError?>
}

extension ESAppleSignInButton: View {
    public var body: some View {
        switch status {
        case .notRequired:
            Button("Tap to continue") {
                successAction.update(nil)
            }
            
        case .required:
            SignInWithAppleButton { authorizationRequest in
                
            } onCompletion: { authorizationResult in
                switch authorizationResult {
                case .success(let authorization):
                    successAction.update(authorization)
                case .failure:
                    errorState.update(.generic)
                }
            }
        }
    }
}

public extension ESAppleSignInButton {
    static func previewAppleSignInButton() -> Self {
        .init(
            status: .notRequired,
            successAction: .noEffect(nil),
            errorState: .noEffect(nil)
        )
    }
}

#if targetEnvironment(simulator)
#Preview {
    ESAppleSignInButton.previewAppleSignInButton()
}
#endif
