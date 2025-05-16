import SwiftUI
import ESDataStructure
import ESLiveData
import ESReusableUI

struct PMMultipleAnswerView: HashIdentifiable {
    let question: String
    let options: [String]
    let selectionIndices: ValueChangedEffect<[Int]?>
    let submitAction: ActionEffect
}

extension PMMultipleAnswerView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(question)
                    .font(.headline)
                    .padding(.bottom, 16)
                
                ForEach(options, id: \.self) { option in
                    Button(action: {
                        guard let currentSelection = selectionIndices.currentValue else {
                            selectionIndices.update([options.firstIndex(of: option)!])
                            return
                        }
                        if let index = options.firstIndex(of: option) {
                            if currentSelection.contains(index) {
                                selectionIndices.update(currentSelection.filter { $0 != index })
                            } else {
                                selectionIndices.update(currentSelection + [index])
                            }
                        }
                    }) {
                        HStack {
                            Text(option)
                                .font(.body)
                                .foregroundColor(.primary)
                                .padding(.vertical, 12)
                            
                            Spacer()
                            
                            if let currentSelection = selectionIndices.currentValue,
                               let index = options.firstIndex(of: option),
                               currentSelection.contains(index) {
                                Image(systemName: "checkmark.square.fill")
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding(.horizontal, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background {
                            if let currentSelection = selectionIndices.currentValue,
                               let index = options.firstIndex(of: option),
                               currentSelection.contains(index) {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.blue.opacity(0.2))
                            } else {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.gray.opacity(0.2))
                            }
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.bottom, 8)
                }
                
                Spacer()
                
                Button(action: {
                    submitAction.occurs()
                }) {
                    Text(String.localizable("Submit"))
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 44)
                        .background(Color.green)
                        .cornerRadius(8)
                }
                .padding(.top, 16)
            }
        }
        .padding()
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
