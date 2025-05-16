import Combine
import ESLiveData
import ESDataModel
import ESDataSource

public final class FCLandingViewModel: StreamViewModel<FCLandingView> {
    @MainActor
    public init(container: FCContainer) {
        let dataSource = container.flashCardDataSource.resolved()
        let isFlippedPublisher = CurrentValueSubject<Bool, Never>(false)
        
        let questionsListOpenPublisher = dataSource.isMenuListOpenPublisher
        
        let combinedPublishers = Publishers.CombineLatest3(
            dataSource.currentIndexPublisher,
            dataSource.totalCardsPublisher,
            questionsListOpenPublisher
        )
        
        super.init(
            dataViewPublisher: combinedPublishers
                .map { currentIndex, totalCards, isQuestionListOpen in
                    FCLandingView(
                        itemView: .viewObserved(
                            stream: FCItemViewModel(container: container)
                        ), questionPickerView: .viewObserved(
                            stream: FCQuestionPickerViewModel(container: container)
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
                        isQuestionListOpen: .onUpdated(fromInitial: isQuestionListOpen, action: { newValue in
                            dataSource.setMenuList(isOpen: newValue)
                        }),
                        canGoNext: currentIndex < totalCards - 1,
                        canGoPrevious: currentIndex > 0
                    )
                }
                .eraseToAnyPublisher()
        )
        
    }
}
