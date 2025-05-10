import SwiftUI
import ESDataStructure
import ESLiveData

struct FCItemView: HashIdentifiable {
    let flippedValues: ValueChangedEffect<Bool>
    let question: String
    let answers: [String]
}

extension FCItemView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(flippedValues.currentValue ? Color.blue.opacity(0.15) : Color.green.opacity(0.15))
                .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
            
            VStack {
                Spacer()
                Group {
                    if flippedValues.currentValue {
                        VStack(alignment: .leading, spacing: 4) {
                            ForEach(answers, id: \.self) {
                                Text("◾️" + $0)
                            }
                        }
                    } else {
                        Text(question)
                    }
                }
                .font(.body.weight(.semibold))
                .multilineTextAlignment(.leading)
                .foregroundColor(.primary)
                .padding(.horizontal)
                .rotation3DEffect(
                    .degrees(
                        flippedValues.currentValue ? 180 : 0
                    ), axis: (x: 0, y: 1, z: 0)
                )
                
                Spacer()
            }
        }
        .rotation3DEffect(
            .degrees(
                flippedValues.currentValue ? 180 : 0
            ),
            axis: (x: 0, y: 1, z: 0)
        )
        .animation(.easeInOut, value: flippedValues.currentValue)
        .frame(minHeight: 220, maxHeight: 300)
        .padding(.horizontal)
        .onTapGesture {
            flippedValues.update(!flippedValues.currentValue)
        }
    }
}

#if targetEnvironment(simulator)
#Preview {
    FCItemView.preview()
}

extension FCItemView {
    static func preview() -> Self {
        .init(
            flippedValues: .noEffect(false),
            question: "What are the two parts of the U.S. Congress?",
            answers: [
                "The Senate and House (of Representatives)",
                "The Cabinet and Congress",
                "The President and Vice President",
                "The Judicial and Executive branches"
            ]
        )
    }
}
#endif
