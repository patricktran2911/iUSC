import SwiftUI
import ESDataStructure
import ESLiveData
import ESReusableUI

public struct FCInputView: HashIdentifiable {
    let editorButton: FCInputEditorButton
    let inputTextField: ObservedDataView<FCInputTextField>
    let datePickerView: ObservedDataView<FCDatePickerView>
}

extension FCInputView: View {
    public var body: some View {
        VStack {
            HStack(alignment: .bottom) {
//                editorButton
                inputTextField
            }
            .padding(.bottom, .pi * 2)
            
//            datePickerView
        }
    }
}

#if targetEnvironment(simulator)
#Preview(".no date picker") {
    FCInputView.previewInputView()
}

#Preview(".date picker") {
    FCInputView.previewInputView(
        datePickerView: .previewDatePickerView()
    )
}

public extension FCInputView {
    static func previewInputView(
        datePickerView: FCDatePickerView? = nil
    ) -> Self {
        .init(
            editorButton: .previewEditorButton(),
            inputTextField: .const(.previewNormalTextFieldWithVoice()),
            datePickerView: datePickerView.unwrap()
        )
    }
}
#endif
