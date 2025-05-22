import SwiftUI
import ESDataStructure
import ESLiveData

struct FCQuestionPickerView: HashIdentifiable {
    let questions: [String]
    let selectedIndex: ValueChangedEffect<Int>
}

extension FCQuestionPickerView: View {
    var body: some View {
        NavigationView {
            ScrollViewReader { reader in
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 8) {
                        ForEach(questions.indices, id: \ .self) { index in
                            HStack(alignment: .top, spacing: 10) {
                                Text("\(index + 1)")
                                    .font(.caption2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(index == selectedIndex.currentValue ? .white : .blue)
                                    .padding(4)
                                    .background(
                                        Circle()
                                            .fill(index == selectedIndex.currentValue ? Color.blue : Color.blue.opacity(0.1))
                                    )

                                Text(questions[index])
                                    .font(.caption)
                                    .foregroundColor(.primary)
                                    .lineLimit(2)
                                    .multilineTextAlignment(.leading)

                                Spacer()

                                if index == selectedIndex.currentValue {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.blue)
                                }
                            }
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(index == selectedIndex.currentValue ? Color.blue.opacity(0.1) : Color(.secondarySystemBackground))
                            )
                            .contentShape(Rectangle())
                            .onTapGesture {
                                selectedIndex.update(index)
                            }
                            .tag(index)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)
                    .onAppear {
                        withAnimation {
                            reader.scrollTo(selectedIndex.currentValue, anchor: .center)
                        }
                    }
                }
                .navigationTitle("All Questions")
                .navigationBarTitleDisplayMode(.inline)
            }
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
