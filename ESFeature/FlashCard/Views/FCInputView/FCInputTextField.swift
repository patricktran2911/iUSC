import SwiftUI
import ESDataStructure
import ESLiveData
import ESReusableUI

enum TextFieldIcon {
    case voice
    case send
}

enum FCInputTextField: HashIdentifiable {
    case normal(FCInputNormalTextField)
    case withDatePicker(FCInputDatePickerTextField)
}

extension FCInputTextField: View {
    var body: some View {
        switch self {
        case .normal(let normalTextField):
            normalTextField
            
        case .withDatePicker(let datePickerTextField):
            datePickerTextField
        }
    }
}

#if targetEnvironment(simulator)
#Preview(".all states") {
    VStack(spacing: 32) {
        FCInputTextField.previewNormalTextFieldWithVoice()
        FCInputTextField.previewNormalTextFieldWithSend()
        FCInputTextField.previewTextFieldWithDatePicker()
    }
}

extension FCInputTextField {
    static func previewNormalTextFieldWithVoice() -> Self {
        .normal(.previewMemoInputNormalTextFieldWithVoice())
    }
    
    static func previewNormalTextFieldWithSend() -> Self {
        .normal(.previewMemoInputNormalTextFieldWithSend())
    }
    
    static func previewTextFieldWithDatePicker() -> Self {
        .withDatePicker(.previewFCInputDatePickerTextField())
    }
}

extension FCInputTextField {
    func enterText(_ text: String) {
        switch self {
        case .normal(let normalTextField):
            normalTextField.textChanged.update(text)
        case .withDatePicker(let datePickerTextField):
            datePickerTextField.textChanged.update(text)
        }
    }
    
    @MainActor
    func tapSend() async {
        switch self {
        case .normal(let normalTextField):
            await normalTextField.sendAction.occursAsync()
        case .withDatePicker(let datePickerTextField):
            await datePickerTextField.sendAction.occursAsync()
        }
    }
}
#endif
