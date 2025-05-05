import Foundation
import ESDataStructure
import ESLiveData
import ESDataModel
import ESReusableUI
import SwiftUI
import Combine

final class FCItemViewModel: StreamViewModel<FCItemView> {
    @MainActor
    init(
        container: FCContainer,
        flashCard: DataModel.FlashCard
    ) {
        let isFlippedCardPublisher = CurrentValueSubject<Bool, Never>(false)
        let currentFlashCardPublisher = CurrentValueSubject<DataModel.FlashCard, Never>(flashCard)
        var currentQuestionText = flashCard.question
        var currentAnswerText = flashCard.answer
        super.init(
            dataViewPublisher: isFlippedCardPublisher
                .combineLatest(
                    currentFlashCardPublisher
                )
                .map { isFlipped, updateFlashcard in
                    let questionTextChanged: ValueChangedEffect<String> = .onUpdated(fromInitial: currentQuestionText) { newValue in
                        currentQuestionText = newValue
                    }
                    
                    let answerTextChanged: ValueChangedEffect<String> = .onUpdated(fromInitial: currentAnswerText) { newValue in
                        currentAnswerText = newValue
                    }
                    
                    return FCItemView(
                        questionTextChanged: questionTextChanged,
                        answerTextChanged: answerTextChanged,
                        resetAction: .performing {
                            currentQuestionText = flashCard.question
                            currentAnswerText = flashCard.answer
                            currentFlashCardPublisher.value = flashCard.updating(isEditting: true)
                        },
                        confirmAction: .performing {
                            let question = questionTextChanged.currentValue
                            let answer = answerTextChanged.currentValue
                            
                            await container.flashCardDataSource.resolved().updateFlashCard(
                                flashCard.updating(
                                    question: question,
                                    answer: answer
                                )
                            )
                        },
                        editAction: .performing {
                            currentFlashCardPublisher.value = updateFlashcard.updating(isEditting: true)
                        },
                    isEditing: updateFlashcard.isEditing,
                    isFlipped: .onChanged(fromInitial: isFlipped) { _, updated in
                        isFlippedCardPublisher.value = updated
                    },
                    deleteAction: .noEffect()
                )
            }
            .eraseToAnyPublisher()
        )
    }
}

private extension DataModel.FlashCard {
    func updating(question: String, answer: String) -> Self {
        .init(
            uniqueId: uniqueId,
            category: category,
            question: question,
            answer: answer,
            isEditing: false
        )
    }
    
    func updating(isEditting: Bool) -> Self {
        .init(
            uniqueId: uniqueId,
            category: category,
            question: question,
            answer: answer,
            isEditing: isEditting
        )
    }
}
