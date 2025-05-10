import Combine
import ESLiveData
import ESDataModel
import ESDataSource

final class PMSingleAnswerViewModel: StreamViewModel<PMSingleAnswerView> {
    @MainActor
    public init(container: PMContainer) {
        let pmDataSource = container.practiceModeDataSource.resolved()
        let currentQuestionPublisher = pmDataSource.currentQuestionPublisher
        let selectionIndexPublihser = CurrentValueSubject<Int?, Never>(nil)
        let combinePublishers = Publishers.CombineLatest(currentQuestionPublisher, selectionIndexPublihser)
        super.init(
            statePublisher: combinePublishers
                .map { question, selectionIndex in
                    guard let question else {
                        return .hidden
                    }
                    switch question.questionType {
                    case let .single(question, options, _):
                        return .loaded(
                            PMSingleAnswerView(
                                question: question,
                                options: options,
                                selectionIndex: .onUpdated(
                                    fromInitial: selectionIndex,
                                    action: { newValue in
                                        selectionIndexPublihser.send(newValue)
                                    }),
                                submitAction: .performing {
                                    guard let selectionIndex else {
                                        return
                                    }
                                    pmDataSource.checkAnswer([selectionIndex])
                                }
                            )
                        )
                    default: return .hidden
                    }
                }
                .eraseToAnyPublisher()
        )
    }
}

