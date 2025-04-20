import Combine
import ESDataModel
import ESDataTransport
import ESDataSource

final class AuthenticationRepository: AuthDataSource {
    
    /// `DataState.Auth` publisher
    var authStatePublisher: AnyPublisher<DataState.Auth, Never> {
        currentAuthState.eraseToAnyPublisher()
    }
    private let currentAuthState: CurrentValueSubject<DataState.Auth, Never> = .init(.authenticated(.notRequired))
    
    // MARK: -
    
    func updateAuthState(_ state: DataState.Auth) {
        currentAuthState.value = state
    }
}
