import SwiftUI
import ESDataStructure
import ESLiveData

public struct FCLandingView: HashIdentifiable {
    let studyFlashCards: ObservedDataView<FCListView>
    let addButtonAE: ActionEffect
}

extension FCLandingView: View {
    public var body: some View {
        VStack {
            Spacer()
            
            studyFlashCards
                .padding(.top)
            
            Button {
                addButtonAE.occurs()
            } label: {
                Image(.addIcon)
            }
        }
    }
}

#if targetEnvironment(simulator)
#Preview(".landing page") {
    FCLandingView.previewFCLandingView()
}

public extension FCLandingView {
    static func previewFCLandingView(
        listView: FCListView = .previewListView(),
        inputEditorView: FCInputEditorView? = nil,
        inputView: FCInputView = .previewInputView()
    ) -> Self {
        .init(
            studyFlashCards: .const(listView),
            addButtonAE: .noEffect()
        )
    }
}
#endif
