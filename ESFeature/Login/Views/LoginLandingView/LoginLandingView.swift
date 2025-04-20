import SwiftUI
import ESDataStructure
import ESLiveData
import ESAppleSignIn

public struct LoginLandingView: HashIdentifiable {
    let signInButton: ESAppleSignInButton
}

extension LoginLandingView: View {
    public var body: some View {
        VStack {
            Spacer()
            signInButton
                .frame(height: 44)
                .padding()
        }
        .padding(.bottom)
    }
}

#if targetEnvironment(simulator)
#Preview(".landing page") {
    LoginLandingView.previewLandingView()
}

public extension LoginLandingView {
    static func previewLandingView(
        signInButton: ESAppleSignInButton = .previewAppleSignInButton()
    ) -> Self {
        .init(
            signInButton: signInButton
        )
    }
}
#endif

