import Combine
import ESDataModel
import ESDataTransport
import ESDataSource

final class AuthenticationRepository: AuthDataSource {
    
    var authStatePublisher: AnyPublisher<DataState.Auth, Never> {
        currentAuthState.eraseToAnyPublisher()
    }
    private let currentAuthState: CurrentValueSubject<DataState.Auth, Never> = .init(.authenticated(.notRequired))
    
    
    func updateAuthState(_ state: DataState.Auth) {
        currentAuthState.value = state
    }
}
