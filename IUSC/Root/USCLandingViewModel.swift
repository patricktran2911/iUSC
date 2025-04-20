import Combine
import ESLiveData
import ESDataModel
import ESFlashCard

final class USCLandingViewModel: StreamViewModel<USCLandingView> {
    @MainActor
    init(container: AppContainer) {
        super.init(
            dataViewPublisher: container.authDataSource.resolved().authStatePublisher
                .map { authState in
                    switch authState {
                    case .authenticated:
                            .fcLandingView(.viewBuilt(from: FCLandingViewModel(
                                container: container.fcContainer.resolved()
                            )))
                    case .unauthenticated:
                            .fcLandingView(.viewBuilt(from: FCLandingViewModel(
                                container: container.fcContainer.resolved()
                            )))
                    }
                }
                .eraseToAnyPublisher()
        )
    }
}
