
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
        
        private enum CodingKeys: String, CodingKey {
            case category, type, question, correctAnswers, wrongAnswers, answerType, answerQuantity, answerKey
        }
        
        public init(from decoder: Decoder) throws {
            let c = try decoder.container(keyedBy: CodingKeys.self)
            self.uniqueId = .randomGenerated  // <- ignore any JSON value, always generate
            self.category = try c.decode(String.self, forKey: .category)
            self.type = try c.decode(String.self, forKey: .type)
            self.question = try c.decode(String.self, forKey: .question)
            self.correctAnswers = try c.decode([String].self, forKey: .correctAnswers)
            self.wrongAnswers = try c.decode([String].self, forKey: .wrongAnswers)
            self.answerType = try c.decode(AnswerType.self, forKey: .answerType)
            self.answerQuantity = try c.decodeIfPresent(Int.self, forKey: .answerQuantity)
            self.answerKey = try c.decodeIfPresent(String.self, forKey: .answerKey)
        }
    }
}
