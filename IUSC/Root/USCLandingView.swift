import SwiftUI
import ESDataStructure
import ESLiveData
import ESFlashCard
import ESPracticeMode
import ESLocalizer
import ESAppPurchased
import ESStateSelector

struct USCLandingView: HashIdentifiable {
    let mode: ValueChangedEffect<USCLandingViewModel.RunningMode>
    let appLanguageMenu: ObservedDataView<ESLanguageMenuView>
    let statePickerView: ObservedDataView<SSPickerView>
    let isPopupLanguageMenu: ValueChangedEffect<Bool>
    let fcLandingView: ObservedDataView<FCLandingView>
    let practiceLandingView: ObservedDataView<PMLandingView>
}

extension USCLandingView: View {
    var body: some View {
        VStack(spacing: 12) {
            VStack(spacing: 16) {
                // Header Controls
                HStack(spacing: 12) {
                    statePickerView

                    Spacer()

                    Button {
                        isPopupLanguageMenu.update(true)
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
                    .sheet(isPresented: isPopupLanguageMenu.binding) {
                        appLanguageMenu
                            .padding()
                            .presentationDetents([.fraction(0.4)])
                    }
                }
                .padding(.horizontal)

                Picker(selection: mode.binding) {
                    ForEach(USCLandingViewModel.RunningMode.allCases, id: \ .hashValue) {
                        Text($0.localizedString())
                            .tag($0)
                    }
                } label: {
                    Text(ESLocalizer.text("Mode", table: .landing))
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal, 32)
            }

            Spacer(minLength: 20)

            Group {
                switch mode.currentValue {
                case .study:
                    fcLandingView
                case .practice:
                    practiceLandingView
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal)

            Spacer(minLength: 12)
        }
        .ignoresSafeArea(.all, edges: [.bottom, .horizontal])
        .padding(.top, 24)
        .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
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
            statePickerView: .const(.preview()),
            isPopupLanguageMenu: .noEffect(true),
            fcLandingView: .const(.previewFCLandingView()),
            practiceLandingView: .const(.previewTestModeView()))
    }
}
#endif

