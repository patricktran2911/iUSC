import SwiftUI
import ESDataStructure
import ESLiveData

struct PMFreeAnswerView: HashIdentifiable {
    let question: String
    let answerInput: ValueChangedEffect<String>
    let submitAction: ActionEffect
}

extension PMFreeAnswerView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text(question)
                .font(.headline)
                .padding(.bottom, 16)

            TextField(String.localizable("Enter your answer"), text: answerInput.binding)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 16)

            Spacer()

            Button(action: {
                submitAction.occurs()
            }) {
                Text(String.localizable("Submit"))
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 44)
                    .background(Color.orange)
                    .cornerRadius(8)
            }
            .padding(.top, 16)
        }
        .padding()
    }
}

#if targetEnvironment(simulator)
#Preview {
    PMFreeAnswerView.preview()
}

extension PMFreeAnswerView {
    static func preview() -> Self {
        .init(
            question: "What is the capital of France?",
            answerInput: .noEffect("Paris"),
            submitAction: .noEffect()
        )
    }
}
#endif
