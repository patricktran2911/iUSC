import SwiftUI
import ESDataStructure
import ESLiveData
import ESReusableUI
import ESLocalizer

struct PMMultipleAnswerView: HashIdentifiable {
    let question: String
    let options: [String]
    let selectionIndices: ValueChangedEffect<[Int]?>
    let submitAction: ActionEffect
}

extension PMMultipleAnswerView: View {
    var body: some View {
        VStack(spacing: 24) {
            VStack(alignment: .leading, spacing: 16) {
                Text(question)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                ScrollView {
                    ForEach(options.indices, id: \ .self) { index in
                        let option = options[index]
                        let isSelected = selectionIndices.currentValue?.contains(index) ?? false
                        
                        HStack(spacing: 12) {
                            Image(systemName: isSelected ? "checkmark.square.fill" : "square")
                                .foregroundColor(isSelected ? .blue : .gray)
                            Text(option)
                                .font(.body)
                                .foregroundColor(.primary)
                            Spacer()
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(isSelected ? Color.blue.opacity(0.12) : Color.gray.opacity(0.08))
                        )
                        .onTapGesture {
                            var updated = selectionIndices.currentValue ?? []
                            if isSelected {
                                updated.removeAll { $0 == index }
                            } else {
                                updated.append(index)
                            }
                            selectionIndices.update(updated)
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
                .background(Color.green)
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
    PMMultipleAnswerView.preview()
}

extension PMMultipleAnswerView {
    static func preview() -> Self {
        .init(
            question: "Which of the following are primary colors?",
            options: [
                "Red",
                "Green",
                "Blue",
                "Yellow"
            ],
            selectionIndices: .noEffect([0, 2]),
            submitAction: .noEffect()
        )
    }
}
#endif
