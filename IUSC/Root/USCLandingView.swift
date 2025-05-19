import SwiftUI
import ESDataStructure
import ESLiveData
import ESFlashCard
import ESPracticeMode
import ESLocalizer
import ESAppPurchased

struct USCLandingView: HashIdentifiable {
    let mode: ValueChangedEffect<USCLandingViewModel.RunningMode>
    let appLanguageMenu: ObservedDataView<ESLanguageMenuView>
    let isPopupLangueMenu: ValueChangedEffect<Bool>
    let fcLandingView: ObservedDataView<FCLandingView>
    let practiceLandingView: ObservedDataView<PMLandingView>
}

extension USCLandingView: View {
    var body: some View {
        VStack {
            Button {
                isPopupLangueMenu.update(true)
            } label: {
                HStack(spacing: 8) {
                    Image(systemName: "globe")
                        .font(.body)
                    Text(ESLocalizer.text("Language", table: .landing))
                        .fontWeight(.medium)
                    Image(systemName: "chevron.down")
                        .font(.caption)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(UIColor.secondarySystemBackground))
                )
            }
            .buttonStyle(.plain)
            .sheet(isPresented: isPopupLangueMenu.binding) {
                appLanguageMenu
                    .presentationDetents([.fraction(0.4)])
                    .padding()
            }
            
            
            Picker(selection: mode.binding) {
                ForEach(USCLandingViewModel.RunningMode.allCases, id: \.hashValue) {
                    Text($0.localizedString())
                        .tag($0)
                }
            } label: {
                Text(ESLocalizer.text("Mode", table: .landing))
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
            appLanguageMenu: .const(.preview()),
            isPopupLangueMenu: .noEffect(true),
            fcLandingView: .const(.previewFCLandingView()),
            practiceLandingView: .const(.previewTestModeView()))
    }
}
#endif

