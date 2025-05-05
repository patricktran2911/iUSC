import Combine
import ESLiveData
import ESDataModel
import ESFlashCard
import ESPracticeMode

final class USCLandingViewModel: StreamViewModel<USCLandingView> {
    enum RunningMode: String, CaseIterable, Sendable {
        case study
        case practice
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
                            fcLandingView: .viewBuilt(from: FCLandingViewModel(container: container.fcContainer.resolved())),
                            practiceLandingView: .viewObserved(stream: PMLandingViewModel(container: container.pmContainer.resolved()))
                        )
                    }
                }
                .eraseToAnyPublisher()
        )
    }
}
