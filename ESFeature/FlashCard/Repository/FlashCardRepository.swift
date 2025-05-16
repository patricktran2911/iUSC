import Foundation
import UIKit
import Combine
import ESDataModel
import ESDataTransport
import ESDataSource

class FlashCardRepository: FlashCardDataSource {
    var isMenuListOpenPublisher: AnyPublisher<Bool, Never> {
        isMenuListOpenValueSubject.eraseToAnyPublisher()
    }
    
    private var flashcards: [DataModel.FlashCard] = []
    private let currentIndexSubject = CurrentValueSubject<Int, Never>(0)
    
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
    
    private var isMenuListOpenValueSubject = CurrentValueSubject<Bool, Never>(false)
    private var flashcardsValueSubject = CurrentValueSubject<[DataModel.FlashCard], Never>([])

    init() {
        loadFlashcards()
    }

    func loadFlashcards() {
        flashcards = [DataModel.QuestionDecoded].mockData().map {
            .init(questionDecode: $0)
        }
        flashcardsValueSubject.send(flashcards)
    }

    func nextCard() {
        let current = currentIndexSubject.value
        if !flashcards.isEmpty && current < flashcards.count - 1 {
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
        if index >= 0 && index < flashcards.count {
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
