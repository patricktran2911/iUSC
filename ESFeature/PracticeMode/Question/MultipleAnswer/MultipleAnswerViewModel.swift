import Combine
import ESLiveData
import ESDataModel
import ESDataSource

final class PMMultipleAnswerViewModel: StreamViewModel<PMMultipleAnswerView> {
    @MainActor
    public init(container: PMContainer) {
        let pmDataSource = container.practiceModeDataSource.resolved()
        let currentQuestionPublisher = pmDataSource.currentQuestionPublisher
        let selectionIndicesPublisher = CurrentValueSubject<[Int]?, Never>(nil)

        let combinePublishers = Publishers.CombineLatest(currentQuestionPublisher, selectionIndicesPublisher)

        super.init(
            statePublisher: combinePublishers
                .map { question, selectionIndices in
                    guard let question = question else {
                        return .hidden
                    }
                    switch question.questionType {
                    case let .multiple(questionText, options, _):
                        return .loaded(
                            PMMultipleAnswerView(
                                question: questionText,
                                options: options,
                                selectionIndices: .onUpdated(
                                    fromInitial: selectionIndices,
                                    action: { newValue in
                                        selectionIndicesPublisher.send(newValue)
                                    }
                                ),
                                submitAction: .performing {
                                    guard let indices = selectionIndices, !indices.isEmpty else {
                                        return
                                    }
                                    pmDataSource.checkAnswer(indices)
                                }
                            )
                        )
                    default:
                        return .hidden
                    }
                }
                .eraseToAnyPublisher()
        )
    }
}
