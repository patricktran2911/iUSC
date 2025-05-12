
import Combine
import ESLiveData
import ESDataModel
import ESDataSource

final class PMFreeAnswerViewModel: StreamViewModel<PMFreeAnswerView> {
    @MainActor
    public init(container: PMContainer) {
        let pmDataSource = container.practiceModeDataSource.resolved()
        let currentQuestionPublisher = pmDataSource.currentQuestionPublisher
        let answerInputPublisher = CurrentValueSubject<String, Never>("")

        let combinePublishers = Publishers.CombineLatest(currentQuestionPublisher, answerInputPublisher)

        super.init(
            statePublisher: combinePublishers
                .map { question, answerText in
                    guard let question = question else {
                        return .hidden
                    }
                    switch question.questionType {
                    case let .onlineCheck(question, _):
                        return .loaded(
                            PMFreeAnswerView(
                                question: question,
                                answerInput: .onUpdated(
                                    fromInitial: answerText,
                                    action: { newValue in
                                        answerInputPublisher.send(newValue)
                                    }
                                ),
                                submitAction: .performing {
                                    guard !answerText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
                                        return
                                    }
                                    pmDataSource.checkAnswerOnline(answerText)
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
