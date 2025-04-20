import Foundation
import ESDataStructure

public extension DataState {
    enum LocalNotification<Request: Modelable>: Modelable {
        /// App just load up
        case initial
        
        /// Right before we request to add a new local notification
        case waitingToAdd(Request, existing: [Request])
        
        /// Local notification request is successfully scheduled
        case scheduled([Request])
        
        /// Scheduling did not occurs due to unauthorized
        /// Currently this imply we will wipe out all existing request due to no permission
        case unauthorized
        
        /// We may be authorized, but somehow failed to schedule the request
        /// Recovering to any existing request in this case
        case handledError([Request])
    }
}

public extension DataState.LocalNotification {
    var previousRequests: [Request] {
        switch self {
        case .initial:
            []
        case .waitingToAdd(_, let existing):
            existing
        case .scheduled(let scheduled):
            scheduled
        case .unauthorized:
            []
        case .handledError(let recover):
            recover
        }
    }
    
    var currentRequests: [Request] {
        switch self {
        case .initial:
            []
        case .waitingToAdd(let request, let existing):
            [request] + existing
        case .scheduled(let scheduled):
            scheduled
        case .unauthorized:
            []
        case .handledError(let recover):
            recover
        }
    }
    
    var isAuthorized: Bool {
        switch self {
        case .initial: true
        case .waitingToAdd, .scheduled, .handledError: true
        case .unauthorized: false
        }
    }
}
