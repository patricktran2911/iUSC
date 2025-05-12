import Foundation
import ESDataStructure

public extension DataModel {
    struct PracticeQuestion: Modelable {
        public enum QuestionType: Codable, Hashable, Sendable {
            case single(question: String, options: [String], correctAnswer: String)
            case multiple(question: String, options: [String], correctAnswer: [String], answerQuantity: Int?)
            case onlineCheck(question: String, correctAnswers: [String])
            
            public static func == (lhs: Self, rhs: Self) -> Bool {
                return lhs.hashValue == rhs.hashValue
            }
        }
        
        public let uniqueId: Identifier.PracticeQuestion
        public let questionType: QuestionType
        
        public init(
            uniqueId: Identifier.PracticeQuestion = .randomGenerated,
            questionType: QuestionType
        ) {
            self.uniqueId = uniqueId
            self.questionType = questionType
        }
    }
}
