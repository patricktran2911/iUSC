import Combine
import ESLiveData
import ESDataModel
import ESDataSource

final class PPMQuestionViewModel: StreamViewModel<PMQuestionView> {
    
    @MainActor
    public init(container: PMContainer) {
        let pmDataSource = container.practiceModeDataSource.resolved()
        let currentQuestionPublisher = pmDataSource.currentQuestionPublisher
        let currentSelectionsIndexPublisher = CurrentValueSubject<Set<Int>?, Never>(nil)
        let freeAnswerPublisher = CurrentValueSubject<String, Never>("")
        let combinePublishers = Publishers.CombineLatest3(currentQuestionPublisher, currentSelectionsIndexPublisher, freeAnswerPublisher)
        super.init(
            dataViewPublisher: combinePublishers
                .map { question, selectedIndexes, textAnswer in
                    guard let question = question else {
                        return .noQuestion
                    }
                    switch question.questionType {
                    case let .single(question, options, _):
                        return .single(
                            question: question,
                            options: options,
                            selectedIndexOption: .onUpdated(
                                fromInitial: selectedIndexes?.first,
                                action: { newValue in
                                    guard let newValue = newValue else {
                                        return
                                    }
                                    currentSelectionsIndexPublisher.send(Set([newValue]))
                                }),
                            submitAction: .performing {
                                pmDataSource.checkAnswer(Array(selectedIndexes ?? []))
                            })
                    case let .multiple(question, options, _):
                        return .multiple(
                            question: question,
                            options: options,
                            selectedIndexOption: .onUpdated(
                                fromInitial: Array(selectedIndexes ?? []),
                                action: { newValue in
                                    currentSelectionsIndexPublisher.send(Set((newValue ?? [])))
                                }),
                            submitAction: .performing {
                                pmDataSource.checkAnswer(Array(selectedIndexes ?? []))
                            })
                    case let .onlineCheck(question):
                        return .checkOnline(
                            question: question,
                            answerInput: .onUpdated(fromInitial: textAnswer, action: { newValue in
                                freeAnswerPublisher.send(newValue)
                            }),
                            submitAction: .performing {
                                pmDataSource.checkAnswerOnline(textAnswer)
                            })
                    }
                }
                .eraseToAnyPublisher()
        )
    }
}
