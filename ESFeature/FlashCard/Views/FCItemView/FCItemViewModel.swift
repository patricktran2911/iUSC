import Combine
import ESLiveData
import ESDataModel
import ESDataSource

final class FCItemViewModel: StreamViewModel<FCItemView> {
    @MainActor
    public init(container: FCContainer) {
        let fcDataStore = container.flashCardDataSource.resolved()
        let currentQuestionPublisher = fcDataStore.currentFlashcardPublisher
        let isFlippedPublisher = CurrentValueSubject<Bool, Never>(false)
        let combinedPublishers = Publishers.CombineLatest(currentQuestionPublisher, isFlippedPublisher)
        
        super.init(statePublisher: combinedPublishers
            .print("[BOGUS]")
            .map { currentQuestion, isFlipped in
                guard let currentQuestion else {
                    return .hidden
                }
                return .loaded(
                    FCItemView(
                        flippedValues: .onUpdated(fromInitial: isFlipped, action: { newValue in
                            isFlippedPublisher.send(newValue)
                        }),
                        question: currentQuestion.question,
                        answers: currentQuestion.answer
                    )
                )
            }
            .eraseToAnyPublisher()
        )
    }
}

