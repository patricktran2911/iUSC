import Combine
import Foundation
import ESDataStructure
import ESLiveData
import ESDataModel
import ESDataSource

public final class FCListViewModel: StreamViewModel<FCListView> {
    @MainActor
    public init(container: FCContainer) {
        let flashCardDataSource = container.flashCardDataSource.resolved()
        let currentPageIndexPublisher = flashCardDataSource.currentPageIndex
        let combinePublisher = currentPageIndexPublisher.combineLatest(
            container.flashCardDataSource.resolved().flashCardPublisher
        )

        super.init(dataViewPublisher: combinePublisher
            .map { pageIndex, allFlashCard in
                return FCListView(
                    fcList: allFlashCard.map {
                        .viewObserved(stream: FCItemViewModel(container: container, flashCard: $0))
                    },
                    appearAction: .performing {
                        await container.flashCardDataSource.resolved().loadSavedFlashCard()
                    },
                    sceneActiveAction: .performing {
                        await container.flashCardDataSource.resolved().loadSavedFlashCard()
                    },
                    currentIndex: .onUpdated(fromInitial: pageIndex, action: { updateValue in
                        currentPageIndexPublisher.value = updateValue
                    })
                )
            }
            .eraseToAnyPublisher()
        )
    }
}
