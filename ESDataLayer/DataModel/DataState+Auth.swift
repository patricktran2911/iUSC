import Foundation
import ESDataStructure

public extension DataState {
    enum CredentialType: Modelable{
        case appleSignIn(account: String)
        case notRequired
    }
    
    enum Auth: Modelable {
        case unauthenticated
        case authenticated(CredentialType)
    }
}
