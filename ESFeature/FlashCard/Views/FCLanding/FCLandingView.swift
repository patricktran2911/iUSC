import SwiftUI
import ESDataStructure
import ESLiveData

public struct FCLandingView: HashIdentifiable {
    let listView: ObservedDataView<FCListView>
    let addButtonAE: ActionEffect
}

extension FCLandingView: View {
    public var body: some View {
        VStack {
            Spacer()
            listView
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
            listView: .const(listView),
            addButtonAE: .noEffect()
        )
    }
}
#endif
