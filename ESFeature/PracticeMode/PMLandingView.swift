import SwiftUI
import ESDataStructure
import ESLiveData
import ESDataModel
import ESLocalizer

public struct PMLandingView: HashIdentifiable {
    let score: Int
    let state: DataState.TestState
    let questionView: ObservedDataView<PMQuestionView>
    let changeUSStateAction: ActionEffect
    let restartAction: ActionEffect
}

extension PMLandingView: View {
    public var body: some View {
        
        VStack(spacing: 32) {
            // Main content based on state
            switch state {
            case .inProgress:
                VStack(spacing: 24) {
                    questionView
                        .frame(maxWidth: .infinity)

                    HStack {
                        Text(String(localized: "Total Score:", bundle: .module))
                            .font(.body)
                        Text("\(score)")
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundStyle(.green)
                    }
                }
                .padding(.horizontal)

            case .complete:
                VStack(spacing: 20) {
                    Spacer()
                    Text(ESLocalizer.text("Test Complete!", table: .practiceMode))
                        .font(.title)
                        .fontWeight(.bold)

                    Text(ESLocalizer.text("Your score: \(score)", table: .practiceMode))
                        .font(.headline)

                    Button(action: {
                        restartAction.occurs()
                    }) {
                        Text(ESLocalizer.text("Restart Test", table: .practiceMode))
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
            }

            Spacer()
        }
        .padding()
        .background(Color(.systemGroupedBackground))

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
            state: .inProgress,
            questionView: .const(.preview()),
            changeUSStateAction: .noEffect(),
            restartAction: .noEffect()
        )
    }
}
#endif
