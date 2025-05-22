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
        VStack(spacing: 24) {
            Spacer()
            VStack(alignment: .leading, spacing: 12) {
                Text(question)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)

                TextField(ESLocalizer.text("Enter your answer", table: .practiceMode), text: answerInput.binding)
                    .textFieldStyle(.roundedBorder)
                    .padding(.top, 4)
            }

            Spacer()

            Button(action: submitAction.occurs) {
                HStack {
                    Spacer()
                    Text(ESLocalizer.text("Submit", table: .practiceMode))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding()
                .background(Color.orange)
                .cornerRadius(12)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color(UIColor.systemGroupedBackground))
        )
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
