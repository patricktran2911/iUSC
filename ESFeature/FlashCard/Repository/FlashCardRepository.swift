import Foundation
import UIKit
import Combine
import ESDataModel
import ESDataTransport
import ESDataSource

class FlashCardRepository: FlashCardDataSource {    
    private var flashcards: [DataModel.FlashCard] = []
    private let currentIndexSubject = CurrentValueSubject<Int, Never>(0)
    
    var flashcardsPublisher = CurrentValueSubject<[DataModel.FlashCard], Never>([])
    
    var isMenuListOpenPublisher = CurrentValueSubject<Bool, Never>(false)

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

    init() {
        loadFlashcards()
    }

    func loadFlashcards() {
        guard let data = NSDataAsset(name: "100Questions")?.data else  {
            return
        }
        let decoder = JSONDecoder()
        do {
            let questions = try decoder.decode([DataModel.QuestionDecoded].self, from: data)
            flashcards = questions.map {
                .init(questionDecode: $0)
            }
            flashcardsPublisher.send(flashcards)
            
            let current = currentIndexSubject.value
            if current >= flashcards.count || current < 0 {
                 currentIndexSubject.send(0)
            } else {
                 currentIndexSubject.send(current) // Keep current index if still valid
            }
        } catch {
            
        }
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
            isMenuListOpenPublisher.send(false)
        }
    }
}

extension DataModel.FlashCard {
    init(questionDecode: DataModel.QuestionDecoded) {
        self.init(
            uniqueId: .randomGenerated,
            category: questionDecode.category,
            question: questionDecode.question,
            answer: questionDecode.answer,
            isEditing: false
        )
    }
}
