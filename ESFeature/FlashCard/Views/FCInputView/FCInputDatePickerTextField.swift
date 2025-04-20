import ESDataStructure
import ESLiveData
import SwiftUI

public struct FCInputDatePickerTextField: HashIdentifiable {
    let placeHolder: String
    let textFieldIcon: TextFieldIcon
    let textChanged: ValueChangedEffect<String>
    let selectedDate: ValueChangedEffect<Date>
    let sendAction: ActionEffect
    let closeAction: ActionEffect
}

extension FCInputDatePickerTextField: View {
    public var body: some View {
        VStack(alignment: .leading) {
            Button {
                UIWindow.currentKeyWindow?.endEditing(true)
            } label: {
                HStack {
                    Image(systemName: .ESSymbols.clock_fill.name)
                        .font(.ESSystem.body)
                    Text(selectedDate.currentValue.formatted(.dateTime.weekday()) + ",")
                    Text(selectedDate.currentValue.formatted(.dateTime.month().day()))
                    Text("at")
                    Text(selectedDate.currentValue.formatted(.dateTime.hour().minute()))
                    Image.ESResizable.symbols(.chevron_right)
                        .frame(width: 8, height: 12)
                        .font(.ESSystem.body)
                    Spacer()
                    Image.ESResizable.symbols(.xmark)
                        .frame(width: 10, height: 10)
                        .font(.body)
                        .padding(.trailing, .pi * 2)
                        .onTapGesture {
                            closeAction.occurs()
                        }
                }
                .padding(.pi * 2)
                .background(Color(UIColor.systemBlue).opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 14))
            }
            .padding(.top, .pi * 2)
            .padding(.horizontal, .pi * 2)
            
            HStack(alignment: .bottom) {
                TextField(placeHolder, text: textChanged.binding, axis: .vertical)
                    .padding(.leading, .pi * 3)
                    .padding(.bottom, .pi * 3)
                    .padding(.trailing)
                switch textFieldIcon {
                case .voice:
                    Button {
                        // Voice action
                    } label: {
                        Image.ESResizable.symbols(.waveform)
                            .foregroundColor(.red)
                            .frame(width: 20, height: 20)
                            .padding(.trailing, 12)
                            .padding(.bottom, 12)
                            .hidden() // [TODO] renenable voice
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
        }
        .overlay(
            RoundedRectangle(cornerRadius: 22)
                .stroke(style: StrokeStyle(lineWidth: 0.5, dash: [6]))
                .foregroundColor(Color.ESBorder.neutral.color)
        )
    }
}

#if targetEnvironment(simulator)
#Preview(".date picker textfield") {
    FCInputDatePickerTextField.previewFCInputDatePickerTextField()
}

extension FCInputDatePickerTextField {
    static func previewFCInputDatePickerTextField() -> Self {
        .init(
            placeHolder: "Enter a memo",
            textFieldIcon: .voice,
            textChanged: .noEffect(.emptyString),
            selectedDate: .noEffect(.now),
            sendAction: .noEffect(),
            closeAction: .noEffect()
        )
    }
}
#endif
