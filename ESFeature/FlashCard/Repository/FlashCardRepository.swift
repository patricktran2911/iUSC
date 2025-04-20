import Foundation
import Combine
import ESDataModel
import ESDataTransport
import ESDataSource
import ESLocalNotification

final class FlashCardRepository: FlashCardDataSource {
    
    private let userDefaults: UserDefaults
    private var cancellable: AnyCancellable?
    private var hasPermission: Bool = false
    
    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
        self.cancellable = nil
    }
    
    var flashCardPublisher: AnyPublisher<[DataModel.FlashCard], Never> {
        userDefaults
            .publisher(for: \.flashcardHash)
            .map { [userDefaults] _ in
                return userDefaults.getAllFlashCard()
            }
            .eraseToAnyPublisher()
    }
    
    var currentPageIndex: CurrentValueSubject<Int, Never> = .init(0)
    
    @MainActor
    public func addFlashCard(_ flashCard: DataModel.FlashCard) async {
        if !hasPermission || !userDefaults.getAllFlashCard().isEmpty {
            userDefaults.saveFlashCard(flashCard)
            userDefaults.flashcardHash = userDefaults.getAllFlashCard().hashValue
            currentPageIndex.value = userDefaults.getAllFlashCard().count - 1
        }
    }
    
    @MainActor
    func updateFlashCard(_ flashCard: DataModel.FlashCard) async {
        let allFlashCard = userDefaults.getAllFlashCard().map { item in
            if item.uniqueId == flashCard.uniqueId {
                return flashCard
            } else {
                return item
            }
        }
        userDefaults.overrideFlashCards(allFlashCard)
        userDefaults.flashcardHash = userDefaults.getAllFlashCard().hashValue
    }
    
    @MainActor
    public func removeFlashCard(_ id: Identifier.FlashCard) async {
        if !hasPermission || !userDefaults.getAllFlashCard().isEmpty {
            userDefaults.deleteSavedFlashCard(id)
            userDefaults.flashcardHash = userDefaults.getAllFlashCard().hashValue
        }
    }
    
    @MainActor
    public func loadSavedFlashCard() async {
        
    }
}

// MARK: - Persistence

private extension UserDefaults {
    func getAllFlashCard() -> [DataModel.FlashCard] {
        if let savedFlashCardData = object(forKey: "savedFlashCard") as? Data {
            let decoder = JSONDecoder()
            if let loadedFlashCard = try? decoder.decode([DataModel.FlashCard].self, from: savedFlashCardData) {
                return loadedFlashCard
            }
        }
        return []
    }
    
    func saveFlashCard(_ flashCard: DataModel.FlashCard) {
        let updatedFlashCards = getAllFlashCard() + [flashCard]
        overrideFlashCards(updatedFlashCards)
    }
    
    func overrideFlashCards(_ updatedFlashCards: [DataModel.FlashCard]) {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(updatedFlashCards) {
            set(encodedData, forKey: "savedFlashCard")
        }
    }
    
    func deleteSavedFlashCard(_ flashCardId: Identifier.FlashCard) {
        let updatedFlashCard = getAllFlashCard()
            .filter { flashCard in
                flashCard.uniqueId != flashCardId
            }
        
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(updatedFlashCard) {
            set(encodedData, forKey: "savedFlashCard")
        }
    }
}

// define key for observing
extension UserDefaults {
    @objc dynamic var flashcardHash: Int {
        get { integer(forKey: #function)}
        set { setValue(newValue, forKey: #function) }
    }
}
