import SwiftUI
import ESDataStructure
import ESLiveData
import ESFlashCard
import ESPracticeMode

struct USCLandingView: HashIdentifiable {
    let mode: ValueChangedEffect<USCLandingViewModel.RunningMode>
    let fcLandingView: ObservedDataView<FCLandingView>
    let practiceLandingView: ObservedDataView<PMLandingView>
}

extension USCLandingView: View {
    var body: some View {
        VStack {
            Picker(selection: mode.binding) {
                ForEach(USCLandingViewModel.RunningMode.allCases, id: \.hashValue) {
                    Text($0.localizedString())
                        .tag($0)
                }
            } label: {
                Text("Mode")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, 64)
            
            Spacer()
            
            switch mode.currentValue {
            case .study:
                fcLandingView
            case .practice:
                practiceLandingView
            }
            
            Spacer()
        }
    }
}

#if targetEnvironment(simulator)
#Preview(".flashcard") {
    USCLandingView.previewFCLandingView()
}

extension USCLandingView {
    
    static func previewFCLandingView(
        mode: USCLandingViewModel.RunningMode = .study
    ) -> Self {
        .init(
            mode: .noEffect(mode),
            fcLandingView: .const(.previewFCLandingView()),
            practiceLandingView: .const(.previewTestModeView()))
    }
}
#endif

