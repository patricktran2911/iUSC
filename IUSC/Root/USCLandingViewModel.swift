import Combine
import ESLiveData
import ESDataModel
import ESFlashCard
import ESPracticeMode
import ESAppPurchased
import ESLocalizer
import Foundation

final class USCLandingViewModel: StreamViewModel<USCLandingView> {
    enum RunningMode: CaseIterable, Sendable {
        case study
        case practice
        
        func localizedString() -> String {
            switch self {
            case .study:
                ESLocalizer.text("Study", table: .landing)
            case .practice:
                ESLocalizer.text("Practice", table: .landing)
            }
        }
    }
    
    @MainActor
    public init(container: AppContainer) {
        let menuOpenValueSubject = CurrentValueSubject<Bool, Never>(false)
        let authStatePublisher = container.authDataSource.resolved().authStatePublisher
        let selectedMode = CurrentValueSubject<RunningMode, Never>(.study)
        let publishers = Publishers.CombineLatest3(authStatePublisher, selectedMode, menuOpenValueSubject)
        //MARK: need to bring PMStatePicker to another package
        super.init(
            dataViewPublisher: publishers
                .map { authState, mode, isMenuOpen in
                    switch authState {
                    case .authenticated, .unauthenticated:
                        USCLandingView(
                            mode: .onUpdated(fromInitial: mode, action: { newMode in
                                selectedMode.send(newMode)
                            }),
                            appLanguageMenu: .viewObserved(stream: ESLanguageMenuViewModel(dataSource: container.appPurchasedRepository.resolved())),
                            isPopupLangueMenu: .onUpdated(fromInitial: isMenuOpen, action: { newValue in
                                menuOpenValueSubject.send(newValue)
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
