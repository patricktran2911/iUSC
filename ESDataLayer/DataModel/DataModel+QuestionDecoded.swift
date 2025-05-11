
public extension DataModel {
    struct QuestionDecoded: Decodable {
        public enum AnswerType: String, Decodable {
            case single = "singleAnswer"
            case multiple = "multipleAnswer"
            case interchange = "interchangeAnswer"
            case stateAnswer = "stateAnswer"
            case peopleAnswer = "peopleAnswer"
        }
        
        public let category: String
        public let type: String
        public let question: String
        public let correctAnswers: [String]
        public let wrongAnswers: [String]
        public let answerType: AnswerType
        public let answerQuantity: Int?
        public let answerKey: String?
    }
}
