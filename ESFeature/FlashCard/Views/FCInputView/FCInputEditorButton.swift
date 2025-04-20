import SwiftUI
import ESDataStructure
import ESLiveData
import ESReusableUI

public struct FCInputEditorButton: HashIdentifiable {
    let actionEffect: ActionEffect
}

extension FCInputEditorButton: View {
    public var body: some View {
        Button(action: actionEffect.occurs) {
            Image.ESResizable.symbols(.calendar_circle_fill)
                .frame(width: 40, height: 40)
                .symbolRenderingMode(.hierarchical)
                .foregroundStyle(.gray)
                .font(.ESSystem.body)
                .padding(2)
        }
    }
}

#if targetEnvironment(simulator)
#Preview(".editor button") {
    FCInputEditorButton.previewEditorButton()
}

public extension FCInputEditorButton {
    static func previewEditorButton() -> Self {
        .init(actionEffect: .noEffect())
    }
}
#endif
