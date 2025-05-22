import Combine
import ESLiveData
import ESDataModel
import ESDataSource
import ESStateSelector

public final class PMLandingViewModel: StreamViewModel<PMLandingView> {

    @MainActor
    public init(container: PMContainer) {
        let practiceModeDataSource = container.practiceModeDataSource.resolved()

        let scorePublisher = practiceModeDataSource.practiceScorePublisher
        let practiceStatePublisher = practiceModeDataSource.testStatePublisher
        let currentAreaTestPublisher = practiceModeDataSource.currentAreaTestPublisher
        let showUSStatePublisher = practiceModeDataSource.showStatePickerPublisher
        
        super.init(
            dataViewPublisher: Publishers.CombineLatest4(
                showUSStatePublisher,
                scorePublisher,
                practiceStatePublisher,
                currentAreaTestPublisher
            )
            .map { isShowingUSStatePicker, score, practiceState, currentTestingUSState in
                return PMLandingView(
                    score: score,
                    state: practiceState,
                    questionView: .viewObserved(stream: PMQuestionViewModel(container: container)),
                    changeUSStateAction: .performing {
                        practiceModeDataSource.showStatePicker(true)
                    },
                    restartAction: .performing {
                        practiceModeDataSource.loadRandomQuestions(count: 10)
                    }
                )
            }
            .eraseToAnyPublisher()
        )
    }
}
