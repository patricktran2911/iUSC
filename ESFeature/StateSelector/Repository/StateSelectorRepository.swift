import Combine
import ESDataSource
import ESDataModel
import Foundation

public final class StateSelectorRepository: StateSelectorDataSource {
    public var currentUSStatePublisher: AnyPublisher<DataState.USState, Never> {
        UserDefaults.standard.publisher(for: \.currentState).map {
            .init(rawValue: $0) ?? .CA
        }
        .eraseToAnyPublisher()
    }
    
    public var stateSearchPublisher: AnyPublisher<[DataState.USState], Never> {
        searchText.map { text in
            if text.isEmpty {
                return []
            }
            
            let allStates = DataState.USState.allCases.map {
                $0.fullStateName
            }
            let result = self.fuzzyMatch(input: text, against: allStates)
            return DataState.USState.allCases.filter {
                result.contains($0.fullStateName)
            }.sorted {
                self.similarity(a: text, b: $0.fullStateName.lowercased())
                > self.similarity(a: text, b: $1.fullStateName.lowercased())
            }
        }
        .eraseToAnyPublisher()
    }
    
    // MARK: Retain data
    public var currentSearchTextPublisher: AnyPublisher<String, Never> {
        searchText.eraseToAnyPublisher()
    }
    
    private var isShowStatePicker = CurrentValueSubject<Bool, Never>(false)
    private var searchResult = CurrentValueSubject<[DataState.USState], Never>([])
    private var searchText = CurrentValueSubject<String, Never>("")
    
    public init() {}
    
    public func updateState(_ state: DataState.USState) {
        UserDefaults.standard.currentState = state.rawValue
    }
    
    public func updateSearchBar(_ text: String) {
        searchText.value = text
    }
    
    private func fuzzyMatch(input: String, against candidates: [String], threshold: Double = 0.5) -> [String] {
        let normalizedInput = input.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        return candidates.compactMap { candidate in
            let normalizedCandidate = candidate.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
            let score = similarity(a: normalizedInput, b: normalizedCandidate)
            return score >= threshold ? candidate : nil
        }
    }
}

private extension StateSelectorRepository {
    private func similarity(a: String, b: String) -> Double {
        let distance = levenshtein(a, b)
        return 1.0 - Double(distance) / Double(max(a.count, b.count))
    }

    private func levenshtein(_ a: String, _ b: String) -> Int {
        let a = Array(a)
        let b = Array(b)
        var dist = Array(repeating: Array(repeating: 0, count: b.count + 1), count: a.count + 1)

        for i in 0...a.count {
            dist[i][0] = i
        }

        for j in 0...b.count {
            dist[0][j] = j
        }

        for i in 1...a.count {
            for j in 1...b.count {
                if a[i - 1] == b[j - 1] {
                    dist[i][j] = dist[i - 1][j - 1]
                } else {
                    dist[i][j] = min(
                        dist[i - 1][j] + 1,
                        dist[i][j - 1] + 1,
                        dist[i - 1][j - 1] + 1
                    )
                }
            }
        }

        return dist[a.count][b.count]
    }

}


public extension UserDefaults {
    @objc dynamic var currentState: String {
        get {
            guard let state = string(forKey: "practice_area") else {
                return "area_CA"
            }
            return state
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "practice_area")
        }
    }
}
