import Foundation

public extension String {
    struct DateMatched {
        public let inferredDate: Date
        public let matchingText: String
    }
    
    /// Attempt to extract any known date phrase from the text user entered
    func inferDateFromText(anchorTime: AnchorTime) -> DateMatched? {
        guard let extractedDigit = Int(components(separatedBy: CharacterSet.decimalDigits.inverted).joined()) else {
            return nil
        }
        
        let fullText = lowercased()
        let multiplyFactorForDigit = Self.multiplyFactorMap(digit: extractedDigit)
            .first { key, _ in
                fullText.range(of: key) != nil
            }
        
        guard let multiplyFactorForDigit else {
            return nil
        }
        
        let inferredDate = (TimeInterval(extractedDigit) * multiplyFactorForDigit.value).makeDate(anchorTime: anchorTime)
        let matchingText = multiplyFactorForDigit.key
        return DateMatched(
            inferredDate: inferredDate,
            matchingText: matchingText
        )
    }
    
    /// Removing the matching text used to infer date
    func removeFromPhrase(dateMatched: DateMatched?) -> String {
        guard let matchingText = dateMatched?.matchingText else {
            return self
        }
        
        let removedPhrases = [
            "in \(matchingText)",
            "in about \(matchingText)"
        ]
        
        var resultString = self
        removedPhrases.forEach { valueToRemove in
            resultString = resultString.replacingOccurrences(of: valueToRemove, with: "")
        }
        
        return resultString
    }
    
    private static func multiplyFactorMap(digit: Int) -> [String: TimeInterval] {
        var multiplyFactor: [String: TimeInterval] = [:]
        
        [
            "\(digit)s",        "\(digit) s",
            "\(digit)sec",      "\(digit) sec",
            "\(digit)second",   "\(digit) second",
            "\(digit)seconds",  "\(digit) seconds",
        ]
        .forEach { multiplyFactor[$0] = 1.seconds }
        
        [
            "\(digit)m",        "\(digit) m",
            "\(digit)min",      "\(digit) min",
            "\(digit)minute",   "\(digit) minute",
            "\(digit)minutes",  "\(digit) minutes",
        ]
        .forEach { multiplyFactor[$0] = 1.minutes }
        
        [
            "\(digit)h",        "\(digit) h",
            "\(digit)hour",     "\(digit) hour",
            "\(digit)hours",    "\(digit) hours",
        ]
        .forEach { multiplyFactor[$0] = 1.hours }
        
        [
            "\(digit)d",        "\(digit) d",
            "\(digit)day",      "\(digit) day",
            "\(digit)days",     "\(digit) days",
        ]
        .forEach { multiplyFactor[$0] = 1.days }
        
        [
            "\(digit)w",        "\(digit) w",
            "\(digit)week",     "\(digit) week",
            "\(digit)weeks",    "\(digit) weeks",
        ]
        .forEach { multiplyFactor[$0] = 1.weeks }
        
        [
            "\(digit)mo",       "\(digit) mo",
            "\(digit)month",    "\(digit) month",
            "\(digit)months",   "\(digit) months",
        ]
        .forEach { multiplyFactor[$0] = 30.days }
        
        return multiplyFactor
    }
}
