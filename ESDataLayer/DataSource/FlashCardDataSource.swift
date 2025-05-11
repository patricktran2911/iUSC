import Combine
import Foundation
import ESLiveData
import ESDataModel

// Protocol for the Flashcard Data Source
public protocol FlashCardDataSource {
    var flashcardsPublisher: CurrentValueSubject<[DataModel.FlashCard], Never> { get }
    var currentFlashcardPublisher: AnyPublisher<DataModel.FlashCard?, Never> { get }
    var isMenuListOpenPublisher: CurrentValueSubject<Bool, Never> { get set }
    var currentIndexPublisher: AnyPublisher<Int, Never> { get }
    var totalCardsPublisher: AnyPublisher<Int, Never> { get }

    func loadFlashcards()
    func nextCard()
    func previousCard()
    func setCurrentCard(at index: Int)
}
