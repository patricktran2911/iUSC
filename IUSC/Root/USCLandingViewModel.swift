import Combine
import ESLiveData
import ESDataModel
import ESFlashCard
import ESPracticeMode
import Foundation

final class USCLandingViewModel: StreamViewModel<USCLandingView> {
    enum RunningMode: CaseIterable, Sendable {
        case study
        case practice
        
        func localizedString() -> String {
            switch self {
            case .study:
                String(localized: "Study", table: "USCLandingLocalized")
            case .practice:
                String(localized: "Practice", table: "USCLandingLocalized")
            }
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
