import Combine
import ESLiveData
import ESDataModel
import ESDataSource

final class PPMQuestionViewModel: StreamViewModel<PMQuestionView> {
    
    @MainActor
    public init(container: PMContainer) {
        let pmDataSource = container.practiceModeDataSource.resolved()
        let questionPublihser = pmDataSource.currentQuestionPublisher
        super.init(
            dataViewPublisher: questionPublihser
                .map { question in
                    guard question != nil else {
                        return .noQuestion
                    }
                    return .question(
                        singleAnswerView: .viewObserved(
                            stream: PMSingleAnswerViewModel(container: container)
                        ),
                        multipleAnswerView: .viewObserved(
                            stream: PMMultipleAnswerViewModel(container: container)
                        ),
                        freeAnswerView: .viewObserved(
                            stream: PMFreeAnswerViewModel(container: container)
                        )
                    )
                }
                .eraseToAnyPublisher()
        )
    }
}
