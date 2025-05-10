import SwiftUI
import ESDataStructure
import ESLiveData

public struct FCLandingView: HashIdentifiable {
    let itemView: ObservedDataView<FCItemView>
    let currentIndex: Int
    let totalCards: Int
    let nextAction: ActionEffect
    let previousAction: ActionEffect
    let canGoNext: Bool
    let canGoPrevious: Bool
}

extension FCLandingView: View {
    public var body: some View {
        VStack(spacing: 24) {
            Spacer()
            if totalCards > 0 {
                Text("Card \(currentIndex + 1) of \(totalCards)")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
                itemView
                
                HStack(spacing: 20) {
                    Button(action: { previousAction.occurs() }) {
                        Label("Previous", systemImage: "arrow.left.circle.fill")
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(!canGoPrevious)
                                        
                    Button(action: { nextAction.occurs() }) {
                        Label("Next", systemImage: "arrow.right.circle.fill")
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(!canGoNext)
                }
                .labelStyle(.titleAndIcon)
                .padding(.top, 8)
            } else {
                Spacer()
                Text("No flashcards available.")
                    .font(.title3)
                    .foregroundColor(.secondary)
                Spacer()
            }
            
            Spacer()
        }
        .padding()
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
            currentIndex: 0,
            totalCards: 5,
            nextAction: .noEffect(),
            previousAction: .noEffect(),
            canGoNext: true,
            canGoPrevious: false
        )
    }
}
#endif
