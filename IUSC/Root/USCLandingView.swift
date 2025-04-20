import SwiftUI
import ESDataStructure
import ESLiveData
import ESFlashCard

enum USCLandingView: HashIdentifiable {
    case fcLandingView(FCLandingView)
}

extension USCLandingView: View {
    var body: some View {
        switch self {
        case .fcLandingView(let memoLandingView):
            memoLandingView
        }
    }
}

#if targetEnvironment(simulator)
#Preview(".flashcard") {
    USCLandingView.previewFCLandingView()
}

extension USCLandingView {
    
    static func previewFCLandingView(
        _ landingView: FCLandingView = .previewFCLandingView()
    ) -> Self {
        .fcLandingView(.previewFCLandingView())
    }
}
#endif

