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
        VStack(spacing: 0) {
            HStack {
                Text(ESLocalizer.text("Flashcards", table: .flashcard))
                    .font(.headline)
                    .foregroundColor(.primary)

                Spacer()

                Button {
                    isQuestionListOpen.update(true)
                } label: {
                    Image(systemName: "square.grid.2x2")
                        .font(.system(size: 18, weight: .medium))
                        .padding(10)
                        .background(
                            Circle()
                                .fill(Color(UIColor.tertiarySystemBackground))
                        )
                }
                .buttonStyle(.plain)
            }
            .padding()
            .background(Color(UIColor.secondarySystemBackground))

            Divider()

            if totalCards > 0 {
                VStack(spacing: 12) {
                    // Progress
                    HStack {
                        Text(ESLocalizer.text("Question", table: .flashcard))
                            .font(.footnote)
                            .foregroundColor(.secondary)

                        Spacer()

                        Text("\(currentIndex + 1) / \(totalCards)")
                            .font(.footnote.bold())
                            .foregroundColor(.accentColor)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)

                    Divider()

                    itemView
                        .onStateChangeAnimate(.smooth, transition: .slide)
                        .frame(maxHeight: .infinity)
                        .padding()
                        
                    HStack(spacing: 12) {
                        Button(action: { previousAction.occurs() }) {
                            Label(ESLocalizer.text("Previous", table: .flashcard), systemImage: "arrow.left")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(!canGoPrevious)

                        Button(action: { nextAction.occurs() }) {
                            Label(ESLocalizer.text("Next", table: .flashcard), systemImage: "arrow.right")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(!canGoNext)
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                .padding(.top, 8)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                Spacer()
                Text(ESLocalizer.text("No flashcards available.", table: .flashcard))
                    .font(.body)
                    .foregroundColor(.secondary)
                Spacer()
            }
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        .sheet(isPresented: isQuestionListOpen.binding) {
            questionPickerView
                .padding()
                .presentationDetents([.medium, .large])
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
