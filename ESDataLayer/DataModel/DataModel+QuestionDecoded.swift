
public extension DataModel {
    struct QuestionDecoded: Modelable {
        public enum AnswerType: String, Modelable {
            case single = "singleAnswer"
            case multiple = "multipleAnswer"
            case interchange = "interchangeAnswer"
            case stateAnswer = "stateAnswer"
            case peopleAnswer = "peopleAnswer"
        }
        
        public let uniqueId: Identifier.QuestionDecoded
        public let category: String
        public let type: String
        public let question: String
        public let correctAnswers: [String]
        public let wrongAnswers: [String]
        public let answerType: AnswerType
        public let answerQuantity: Int?
        public let answerKey: String?
        
        public init(uniqueId: Identifier.QuestionDecoded = .randomGenerated, category: String, type: String, question: String, correctAnswers: [String], wrongAnswers: [String], answerType: AnswerType, answerQuantity: Int?, answerKey: String?) {
            self.uniqueId = uniqueId
            self.category = category
            self.type = type
            self.question = question
            self.correctAnswers = correctAnswers
            self.wrongAnswers = wrongAnswers
            self.answerType = answerType
            self.answerQuantity = answerQuantity
            self.answerKey = answerKey
        }
    }
}
