import SwiftUI
import ESDataStructure
import ESLiveData
import ESReusableUI
import ESLocalizer
import Foundation

public struct FCLandingView: HashIdentifiable {
    let itemView: ObservedDataView<FCItemView>
    let questionPickerView: ObservedDataView<FCQuestionPickerView>
    let currentIndex: Int
    let totalCards: Int
    let nextAction: ActionEffect
    let previousAction: ActionEffect
    let isQuestionListOpen: ValueChangedEffect<Bool>
    let canGoNext: Bool
    let canGoPrevious: Bool
}

extension FCLandingView: View {
    public var body: some View {
        ZStack(alignment: .trailing) {
            VStack(spacing: 24) {
                HStack {
                    Spacer()
                    Button {
                        isQuestionListOpen.update(true)
                    } label: {
                        Image(systemName: "list.bullet")
                            .imageScale(.large)
                            .padding(8)
                    }
                }

                Spacer()
                
                if totalCards > 0 {
                    VStack {
                        Group {
                            Text(ESLocalizer.text("Question ", table: .flashcard))
                            + Text(" #\(currentIndex + 1)")
                                .foregroundStyle(Color.blue)
                                .fontWeight(.semibold)
                            + (Text("/ \(totalCards)"))
                        }
                        .font(.body)
                        .foregroundStyle(esColor: .ESText.primary.color)
                        .padding(6)
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.ESBorder.neutral.color, lineWidth: 1)
                        }

                        itemView
                            .onStateChangeAnimate(.smooth, transition: .slide)

                        HStack(spacing: 20) {
                            Button(action: { previousAction.occurs() }) {
                                Label(ESLocalizer.text("Previous", table: .flashcard), systemImage: "arrow.left.circle.fill")
                            }
                            .buttonStyle(.borderedProminent)
                            .disabled(!canGoPrevious)

                            Button(action: { nextAction.occurs() }) {
                                Label(ESLocalizer.text("Next", table: .flashcard), systemImage: "arrow.right.circle.fill")
                            }
                            .buttonStyle(.borderedProminent)
                            .disabled(!canGoNext)
                        }
                        .labelStyle(.titleAndIcon)
                        .padding(.top, 8)
                    }
                    
                } else {
                    Spacer()
                    Text(ESLocalizer.text("No flashcards available.", table: .flashcard))
                        .font(.title3)
                        .foregroundColor(.secondary)
                    Spacer()
                }

                Spacer()
            }
            .padding()
            .blur(radius: isQuestionListOpen.currentValue ? 3 : 0)
            .animation(.easeInOut(duration: 0.25), value: isQuestionListOpen.currentValue)

            if isQuestionListOpen.currentValue {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isQuestionListOpen.update(false)
                    }
                    .transition(.opacity)
            }

            questionPickerView
                .frame(width: 240)
                .background(Color.ESBackground.screen.color)
                .shadow(radius: 10)
                .offset(x: isQuestionListOpen.currentValue ? 0 : 340)
                .animation(.easeInOut(duration: 0.25), value: isQuestionListOpen.currentValue)
        }
    }
}

#if targetEnvironment(simulator)
#Preview(".landing page") {
    FCLandingView.previewFCLandingView()
}

public extension FCLandingView {
    static func previewFCLandingView(
    ) -> Self {
        .init(
            itemView: .const(.preview()),
            questionPickerView: .const(.preview()),
            currentIndex: 0,
            totalCards: 5,
            nextAction: .noEffect(),
            previousAction: .noEffect(),
            isQuestionListOpen: .noEffect(false),
            canGoNext: true,
            canGoPrevious: false
        )
    }
}
#endif
