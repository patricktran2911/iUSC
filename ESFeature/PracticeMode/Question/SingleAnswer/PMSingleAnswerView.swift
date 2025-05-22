import SwiftUI
import ESDataStructure
import ESLiveData
import ESLocalizer

struct PMSingleAnswerView: HashIdentifiable {
    let question: String
    let options: [String]
    let selectionIndex: ValueChangedEffect<Int?>
    let submitAction: ActionEffect
}

extension PMSingleAnswerView: View {
    var body: some View {
        VStack(spacing: 8) {
            VStack(alignment: .leading, spacing: 16) {
                Text(question)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                ScrollView {
                    ForEach(options.indices, id: \ .self) { index in
                        let option = options[index]
                        let isSelected = selectionIndex.currentValue == index
                        
                        HStack(spacing: 12) {
                            Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(isSelected ? .green : .gray)
                            Text(option)
                                .font(.body)
                                .fixedSize(horizontal: false, vertical: true)
                                .foregroundColor(.primary)
                            Spacer()
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(isSelected ? Color.green.opacity(0.12) : Color.gray.opacity(0.08))
                        )
                        .onTapGesture {
                            selectionIndex.update(index)
                        }
                    }
                }
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
                .background(Color.blue)
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
    PMSingleAnswerView.preview()
}

extension PMSingleAnswerView {
    static func preview() -> Self {
        .init(
            question: "What are the two parts of the U.S. Congress?",
            options: [
                "The Senate and House (of Representatives)",
                "The Cabinet and Congress",
                "The President and Vice President",
                "The Judicial and Executive branches"
            ],
            selectionIndex: .noEffect(0),
            submitAction: .noEffect()
        )
    }
}
#endif
