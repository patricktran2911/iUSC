import Combine
import ESDataModel

public protocol AuthDataSource {
    var authStatePublisher: AnyPublisher<DataState.Auth, Never> { get }
    
    func updateAuthState(_ state: DataState.Auth)
}

