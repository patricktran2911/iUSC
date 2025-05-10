import Combine
import ESLiveData
import ESDataModel
import ESDataSource

public final class FCLandingViewModel: StreamViewModel<FCLandingView> {
    @MainActor
    public init(container: FCContainer) {
        let dataSource = container.flashCardDataSource.resolved()
        let isFlippedPublisher = CurrentValueSubject<Bool, Never>(false)
        
        let combinedPublishers = Publishers.CombineLatest(
            dataSource.currentIndexPublisher,
            dataSource.totalCardsPublisher
        )
        
        super.init(
            dataViewPublisher: combinedPublishers
                .map { currentIndex, totalCards in
                    FCLandingView(
                        itemView: .viewObserved(
                            stream: FCItemViewModel(container: container)
                        ),
                        currentIndex: currentIndex,
                        totalCards: totalCards,
                        nextAction: .performing {
                            dataSource.nextCard()
                            isFlippedPublisher.send(false)
                        },
                        previousAction: .performing {
                            dataSource.previousCard()
                            isFlippedPublisher.send(false)
                        },
                        canGoNext: currentIndex < totalCards - 1,
                        canGoPrevious: currentIndex > 0
                    )
                }
                .eraseToAnyPublisher()
        )
        
    }
}
