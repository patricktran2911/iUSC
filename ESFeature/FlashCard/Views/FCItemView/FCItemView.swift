import SwiftUI
import ESDataStructure
import ESLiveData
import UIKit
import ESLocalizer

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
            
            VStack(spacing: 12) {
                Spacer()
                
                Group {
                    if flippedValues.currentValue {
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(answers, id: \ .self) { answer in
                                HStack(alignment: .top, spacing: 6) {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.blue)
                                        .font(.subheadline)
                                    Text(answer)
                                        .foregroundColor(.primary)
                                        .font(.subheadline)
                                }
                            }
                        }
                        .padding(.horizontal)
                        .transition(.opacity)
                    } else {
                        Text(question)
                            .font(.body.weight(.semibold))
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal)
                            .transition(.opacity)
                    }
                }
                .rotation3DEffect(
                    .degrees(flippedValues.currentValue ? 180 : 0),
                    axis: (x: 0, y: 1, z: 0)
                )
                
                Spacer()
                
                Text(ESLocalizer.text(flippedValues.currentValue ? "Tap to view question" : "Tap to view answer", table: .flashcard))
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 12)
                    .rotation3DEffect(
                        .degrees(flippedValues.currentValue ? 180 : 0),
                        axis: (x: 0, y: 1, z: 0)
                    )
            }
        }
        .rotation3DEffect(
            .degrees(flippedValues.currentValue ? 180 : 0),
            axis: (x: 0, y: 1, z: 0)
        )
        .animation(.easeInOut(duration: 0.4), value: flippedValues.currentValue)
        .frame(minHeight: 220, maxHeight: 300)
        .padding(.horizontal)
        .onTapGesture {
            flippedValues.update(!flippedValues.currentValue)
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
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
