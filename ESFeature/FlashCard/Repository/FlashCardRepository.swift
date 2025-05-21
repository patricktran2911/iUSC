import Foundation
import UIKit
import Combine
import ESDataModel
import ESDataTransport
import ESDataSource
import ESAppPurchased
import ESUSCDataRepository

@MainActor
class FlashCardRepository: FlashCardDataSource {
    var isMenuListOpenPublisher: AnyPublisher<Bool, Never> {
        isMenuListOpenValueSubject.eraseToAnyPublisher()
    }
    
    var flashcardsPublisher: AnyPublisher<[DataModel.FlashCard], Never> {
        flashcardsValueSubject.eraseToAnyPublisher()
    }
    
    var currentFlashcardPublisher: AnyPublisher<DataModel.FlashCard?, Never> {
        Publishers.CombineLatest(flashcardsPublisher, currentIndexSubject)
            .map { cards, index in
                guard !cards.isEmpty, index >= 0, index < cards.count else {
                    return nil
                }
                return cards[index]
            }
            .eraseToAnyPublisher()
    }

    var currentIndexPublisher: AnyPublisher<Int, Never> {
        currentIndexSubject.eraseToAnyPublisher()
    }

    var totalCardsPublisher: AnyPublisher<Int, Never> {
        flashcardsPublisher.map { $0.count }.eraseToAnyPublisher()
    }
    
    private let currentIndexSubject = CurrentValueSubject<Int, Never>(0)
    private var isMenuListOpenValueSubject = CurrentValueSubject<Bool, Never>(false)
    private var flashcardsValueSubject = CurrentValueSubject<[DataModel.FlashCard], Never>([])
    private var cancellables = Set<AnyCancellable>()
    private let uscDataSource: USCDataSource

    init(uscDataSource: USCDataSource) {
        self.uscDataSource = uscDataSource
        loadFlashcards()
    }

    func loadFlashcards() {
        uscDataSource.uscis100QuestionsPublisher.sink { questions in
            let flashcards: [DataModel.FlashCard] = questions.map {
                .init(questionDecode: $0)
            }
            self.flashcardsValueSubject.value = flashcards
        }
        .store(in: &cancellables)
    }

    func nextCard() {
        let current = currentIndexSubject.value
        if !flashcardsValueSubject.value.isEmpty && current < flashcardsValueSubject.value.count - 1 {
            currentIndexSubject.send(current + 1)
        }
    }

    func previousCard() {
        let current = currentIndexSubject.value
        if current > 0 {
            currentIndexSubject.send(current - 1)
        }
    }

    func setCurrentCard(at index: Int) {
        if index >= 0 && index < flashcardsValueSubject.value.count {
            currentIndexSubject.send(index)
            isMenuListOpenValueSubject.send(false)
        }
    }
    
    func setMenuList(isOpen: Bool) {
        isMenuListOpenValueSubject.value = isOpen
    }
}

extension DataModel.FlashCard {
    init(questionDecode: DataModel.QuestionDecoded) {
        self.init(
            uniqueId: .randomGenerated,
            category: questionDecode.category,
            question: questionDecode.question,
            answer: questionDecode.correctAnswers,
            isEditing: false
        )
    }
}
