import Foundation
import SwiftUI
import ESDataStructure
import ESLiveData
import GoogleSignInSwift

public enum ESGoogleSignInButton: HashIdentifiable {
    case nonInteractive
    case interactive(ActionEffect)
}

extension ESGoogleSignInButton: View {
    public var body: some View {
        switch self {
        case .nonInteractive:
            Text("GoogleSignIn")
        case .interactive(let actionEffect):
            GoogleSignInButton {
                actionEffect.occurs()
            }
        }
    }
}

#if targetEnvironment(simulator)
#Preview {
    ESGoogleSignInButton.previewGoogleSignIn()
}

extension ESGoogleSignInButton {
    static func previewGoogleSignIn() -> Self {
        .nonInteractive
    }
}
#endif
