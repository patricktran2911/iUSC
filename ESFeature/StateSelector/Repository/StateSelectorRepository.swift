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
    
    private var isShowStatePicker = CurrentValueSubject<Bool, Never>(false)
    public init() {}
    
    public func updateState(_ state: DataState.USState) {
        UserDefaults.standard.currentState = state.rawValue
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
