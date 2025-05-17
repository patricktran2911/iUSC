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
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text(question)
                        .font(.headline)
                        .padding(.bottom, 16)
                    
                    ForEach(options, id: \.self) { option in
                        Button(action: {
                            guard let index = options.firstIndex(of: option) else { return }
                            selectionIndex.update(index)
                        }) {
                            HStack {
                                Text(option)
                                    .font(.body)
                                    .foregroundColor(.primary)
                                    .padding(.vertical, 12)
                                Spacer()
                                if let index = selectionIndex.currentValue,
                                   options[index] == option {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.green)
                                }
                            }
                            .padding(.horizontal, 16)
                            .background {
                                if let index = selectionIndex.currentValue,
                                   options[index] == option {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color.green.opacity(0.2))
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
                }
            }
            
            Button(action: {
                submitAction.occurs()
            }) {
                Text(ESLocalizer.text("Submit", table: .practiceMode))
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 44)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding(.top, 16)
        }
        .padding()
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
