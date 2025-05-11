import Combine
import ESLiveData
import ESDataModel
import ESDataSource

final class FCQuestionPickerViewModel: StreamViewModel<FCQuestionPickerView> {
    @MainActor
    public init(container: FCContainer) {
        let fcDataSource = container.flashCardDataSource.resolved()
        let currentSelectedIndexPublisher = fcDataSource.currentIndexPublisher
        let flashcardsPublisher = fcDataSource.flashcardsPublisher
        let combinedPublishers = Publishers.CombineLatest(flashcardsPublisher, currentSelectedIndexPublisher)
        
        super.init(
            dataViewPublisher: combinedPublishers
                .map { flashcards, index in
                    FCQuestionPickerView(questions: flashcards.map {
                        $0.question
                    }, selectedIndex: .onUpdated(fromInitial: index, action: { newValue in
                        fcDataSource.setCurrentCard(at: newValue)
                    }))
                }
                .eraseToAnyPublisher()
        )
    }
}

