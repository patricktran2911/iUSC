import Combine
import ESLiveData
import ESDataModel
import ESFlashCard
import ESPracticeMode

final class USCLandingViewModel: StreamViewModel<USCLandingView> {
    enum RunningMode: String, CaseIterable, Sendable {
        case study = "Study"
        case practice = "Practice"
        
        func localizedString() -> String {
            String(localized: .init(self.rawValue), comment: "Running mode options")
        }
    }
    
    @MainActor
    init(container: AppContainer) {
        let authStatePublisher = container.authDataSource.resolved().authStatePublisher
        let selectedMode = CurrentValueSubject<RunningMode, Never>(.study)
        let publishers = Publishers.CombineLatest(authStatePublisher, selectedMode)
        super.init(
            dataViewPublisher: publishers
                .map { authState, mode in
                    switch authState {
                    case .authenticated, .unauthenticated:
                        USCLandingView(
                            mode: .onUpdated(fromInitial: mode, action: { newMode in
                                selectedMode.send(newMode)
                            }),
                            fcLandingView: .viewObserved(stream: FCLandingViewModel(container: container.fcContainer.resolved())),
                            practiceLandingView: .viewObserved(stream: PMLandingViewModel(container: container.pmContainer.resolved()))
                        )
                    }
                }
                .eraseToAnyPublisher()
        )
    }
}
