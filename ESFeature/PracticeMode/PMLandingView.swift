import SwiftUI
import ESDataStructure
import ESLiveData
import ESDataModel
import ESLocalizer

public struct PMLandingView: HashIdentifiable {
    let score: Int
    let state: DataState.TestState
    let currentUSState: String?
    let selectUSStatePickerView: ObservedDataView<PMUSStatePickerView>
    let isShowingUSStatePicker: ValueChangedEffect<Bool>
    let questionView: ObservedDataView<PMQuestionView>
    let changeUSStateAction: ActionEffect
    let restartAction: ActionEffect
}

extension PMLandingView: View {
    public var body: some View {
        
        VStack(spacing: 32) {
            HStack {
                if let currentUSState {
                    Button(action: {
                        changeUSStateAction.occurs()
                    }) {
                        HStack(spacing: 6) {
                            Image(systemName: "location.fill")
                            Text(currentUSState)
                                .fontWeight(.semibold)
                            Image(systemName: "chevron.down")
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color.gray.opacity(0.15))
                        .clipShape(Capsule())
                    }
                    .buttonStyle(.plain)
                } else {
                    Button(ESLocalizer.text("Select Your State", table: .practiceMode)) {
                        changeUSStateAction.occurs()
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(Color.red.opacity(0.15))
                    .clipShape(Capsule())
                    .foregroundColor(.red)
                    .fontWeight(.medium)
                }

                Spacer()
            }
            .padding(.horizontal)

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
        .sheet(isPresented: isShowingUSStatePicker.binding) {
            selectUSStatePickerView
                .background(Color.black.opacity(0.2))
                .ignoresSafeArea()
        }
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
            currentUSState: "CA",
            selectUSStatePickerView: .const(.preview()),
            isShowingUSStatePicker: .noEffect(false),
            questionView: .const(.preview()),
            changeUSStateAction: .noEffect(),
            restartAction: .noEffect()
        )
    }
}
#endif
