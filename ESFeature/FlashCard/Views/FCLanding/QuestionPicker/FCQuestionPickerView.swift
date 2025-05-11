import SwiftUI
import ESDataStructure
import ESLiveData

struct FCQuestionPickerView: HashIdentifiable {
    let questions: [String]
    let selectedIndex: ValueChangedEffect<Int>
}

extension FCQuestionPickerView: View {
    var body: some View {
        ScrollViewReader { reader in
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(questions.indices, id: \.self) { index in
                        Button(action: {
                            selectedIndex.update(index)
                        }) {
                            HStack(spacing: 10) {
                                Text("\(index + 1)")
                                    .font(.caption2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(index == selectedIndex.currentValue ? .white : .blue)
                                    .padding(6)
                                    .background(
                                        Circle()
                                            .fill(index == selectedIndex.currentValue ? Color.blue : Color.blue.opacity(0.1))
                                    )

                                Text(questions[index])
                                    .font(.footnote)
                                    .foregroundColor(.primary)
                                    .lineLimit(2)
                                    .multilineTextAlignment(.leading)

                                Spacer()
                            }
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(index == selectedIndex.currentValue ? Color.blue.opacity(0.08) : Color(.systemGray6))
                            )
                            .animation(.easeInOut(duration: 0.15), value: selectedIndex.currentValue)
                        }
                        .tag(index)
                    }
                    Spacer(minLength: 16)
                }
                .padding(.horizontal, 12)
                .padding(.top, 8)
            }
            .onChange(of: selectedIndex.currentValue, { _, newValue in
                reader.scrollTo(newValue, anchor: .center)
            })
        }
    }
}

#if targetEnvironment(simulator)
#Preview {
    FCQuestionPickerView.preview()
}

extension FCQuestionPickerView {
    static func preview() -> Self {
        .init(
            questions: [
                "The Federalist Papers supported the passage of the U.S. Constitution. Name one of the writers",
                "Name one U.S. territory.",
                "Name one state that borders Canada"
            ],
            selectedIndex: .noEffect(1)
        )
    }
}
#endif
