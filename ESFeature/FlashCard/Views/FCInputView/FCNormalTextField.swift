import ESDataStructure
import ESLiveData
import SwiftUI

public struct FCInputNormalTextField: HashIdentifiable {
    let placeHolder: String
    let textFieldIcon: TextFieldIcon
    let textChanged: ValueChangedEffect<String>
    let sendAction: ActionEffect
    let voiceAction: ActionEffect
}

extension FCInputNormalTextField: View {
    public var body: some View {
        HStack(alignment: .bottom) {
            TextField(placeHolder, text: textChanged.binding, axis: .vertical)
                .padding(.pi * 3)
                .padding(.trailing)
            switch textFieldIcon {
            case .voice:
                Button {
                    voiceAction.occurs()
                } label: {
                    Image.ESResizable.symbols(.waveform)
                        .foregroundColor(.red)
                        .frame(width: 20, height: 20)
                        .padding(.trailing, 12)
                        .padding(.bottom, 12)
                        .hidden() // [Enable Voice]
                }
            case .send:
                Button {
                    sendAction.occurs()
                } label: {
                    Image.ESResizable.symbols(.arrow_up_circle_fill)
                        .frame(width: 25, height: 25)
                        .padding(.trailing, 8)
                        .padding(.bottom, 8)
                }
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color.ESBorder.neutral.color, lineWidth: 1))
    }
}

#if targetEnvironment(simulator)
#Preview(".with voice") {
    FCInputNormalTextField.previewMemoInputNormalTextFieldWithVoice()
}

#Preview(".with send") {
    FCInputNormalTextField.previewMemoInputNormalTextFieldWithSend()
}

extension FCInputNormalTextField {
    static func previewMemoInputNormalTextFieldWithVoice() -> Self {
        .init(
            placeHolder: "Enter a memo",
            textFieldIcon: .voice,
            textChanged: .noEffect(.emptyString),
            sendAction: .noEffect(),
            voiceAction: .noEffect()
        )
    }
    
    static func previewMemoInputNormalTextFieldWithSend() -> Self {
        .init(
            placeHolder: "Enter a memo",
            textFieldIcon: .send,
            textChanged: .noEffect(.emptyString),
            sendAction: .noEffect(),
            voiceAction: .noEffect()
        )
    }
}
#endif
