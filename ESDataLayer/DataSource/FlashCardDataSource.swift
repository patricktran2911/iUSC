import Combine
import Foundation
import ESDataModel
import ESDataStructure

public protocol FlashCardDataSource {
    var flashCardPublisher: AnyPublisher<[DataModel.FlashCard], Never> { get }
    
    var currentPageIndex: CurrentValueSubject<Int, Never> { get set }
    
    @MainActor
    func loadSavedFlashCard() async
    
    @MainActor
    func addFlashCard(_ flashCard: DataModel.FlashCard) async
    
    @MainActor
    func updateFlashCard(_ flashCard: DataModel.FlashCard) async
    
    @MainActor
    func removeFlashCard(_ id: Identifier.FlashCard) async
}

public extension FlashCardDataSource {
    @MainActor
    func addFlashCard(category: String, question: String, answer: String) async {
        await addFlashCard(
            DataModel.FlashCard(
                uniqueId: .randomGenerated,
                category: category,
                question: question,
                answer: answer,
                isEditing: false
            )
        )
    }
    
    @MainActor
    func createNewFlashCard() async {
        await addFlashCard(
            .init(
                uniqueId: .randomGenerated,
                category: "General",
                question: "",
                answer: "",
                isEditing: true
            )
        )
    }
}
