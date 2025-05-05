import SwiftUI
import ESDataStructure
import ESLiveData

public struct PMLandingView: HashIdentifiable {
    
    let score: Int
    let state: ValueChangedEffect<PMLandingViewModel.TestState>
    let questionView: ObservedDataView<PMQuestionView>
    let restartAction: ActionEffect
}

extension PMLandingView: View {
    public var body: some View {
        VStack {
            switch state.currentValue {
            case .inProgress:
                VStack {
                    questionView
                    
                    Text("Score: \(score)")
                        .font(.subheadline)
                        .padding()
                }
                
            case .complete:
                VStack {
                    Text("Test Complete!")
                        .font(.largeTitle)
                    Text("Your score: \(score)")
                        .font(.headline)
                    
                    Button("Restart Test") {
                        restartAction.occurs()
                    }
                    .padding()
                    .background(Color.green)
                    .cornerRadius(8)
                    .foregroundColor(.white)
                }
            }
        }
        .padding()
    }
}

#if targetEnvironment(simulator)
#Preview(".landing view") {
    PMLandingView.previewTestModeView()
}

public extension PMLandingView {
    static func previewTestModeView() -> Self {
        PMLandingView(
            score: 1,
            state: .noEffect(.inProgress),
            questionView: .const(.preview()),
            restartAction: .noEffect()
        )
    }
}
#endif
