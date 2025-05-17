import SwiftUI
import ESDataStructure
import ESLiveData
import ESLocalizer

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

            TextField(ESLocalizer.text("Enter your answer", table: .practiceMode), text: answerInput.binding)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 16)

            Spacer()

            Button(action: {
                submitAction.occurs()
            }) {
                Text(ESLocalizer.text("Submit", table: .practiceMode))
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
