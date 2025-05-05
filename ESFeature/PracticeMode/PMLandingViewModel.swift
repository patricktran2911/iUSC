import Combine
import ESLiveData
import ESDataModel
import ESDataSource

public final class PMLandingViewModel: StreamViewModel<PMLandingView> {
    public enum TestState: String, CaseIterable, Equatable, Sendable {
        case inProgress
        case complete
    }
    
    public enum AnswerStatus {
        case doing
        case correct
        case failed
        case needOnlineCheck
    }

    @MainActor
    public init(container: PMContainer) {
        let practiceModeDataSource = container.practiceModeDataSource.resolved()

        let currentQuestionPublisher = practiceModeDataSource.currentQuestionPublisher
        let scorePublisher = practiceModeDataSource.currentScorePublisher
        let statePublisher = CurrentValueSubject<TestState, Never>(.inProgress)

        super.init(
            dataViewPublisher: Publishers.CombineLatest3(
                currentQuestionPublisher,
                scorePublisher,
                statePublisher
            )
            .map { _, score, state in
                PMLandingView(
                    score: score,
                    state: .onUpdated(fromInitial: state, action: { newState in
                        statePublisher.value = newState
                    }),
                    questionView: .viewObserved(stream: PPMQuestionViewModel(container: container)),
                    restartAction: .performing {
                        practiceModeDataSource.loadRandomQuestions(count: 10)
                        statePublisher.value = .inProgress
                    }
                )
            }
            .eraseToAnyPublisher()
        )
    }
}
