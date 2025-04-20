import Foundation

public extension DataModel {
    struct FlashCard: Modelable {
        public let uniqueId: Identifier.FlashCard
        public let category: String
        public let question: String
        public let answer: String
        public let isEditing: Bool
        
        public var updatedAt: Date = Date()
        public var createdAt: Date = Date()
        
        public init(
            uniqueId: Identifier.FlashCard,
            category: String,
            question: String,
            answer: String,
            isEditing: Bool
        ) {
            self.uniqueId = uniqueId
            self.category = category
            self.question = question
            self.answer = answer
            self.isEditing = isEditing
        }
    }
}
