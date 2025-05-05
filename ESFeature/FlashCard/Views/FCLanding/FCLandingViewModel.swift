import Combine
import ESLiveData
import ESDataModel
import ESDataSource

public final class FCLandingViewModel: SingleViewModel<FCLandingView> {
    @MainActor
    public init(container: FCContainer) {
        super.init {
            FCLandingView(
                studyFlashCards: .viewObserved(
                    stream: FCListViewModel(
                        container: container
                    )
                ),
                addButtonAE: .performing {
                    await container.flashCardDataSource.resolved().createNewFlashCard()
                }
            )
        }
    }
}
