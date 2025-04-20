import UserNotifications
import Combine
import ESDataModel
import ESDataSource

public protocol NotificationRequestModelable {
    /// Making Notification Requests from Model
    /// This is allow making multiple notification requests from a single `NotificationRequestModelable`
    ///
    /// @Dicussion:
    /// Any `UNNotificationRequest` that set `request.content.info(for: .referenceNotificationId)` to
    /// be the same as `Identifier.NotificationRequest` of another notification request, if will be clean up together
    /// when the primary request is cancelled. This act as the primary key / foreign key mechanism independently of `Identifer.NotificationCategory`
    func makeNotificationRequests(category: Identifier.NotificationCategory) -> [UNNotificationRequest]
    
    /// Making Model from pending Notification Request
    /// Since we are allow to make multiple requests from a single model, when converting back, the `requestsInSameCategory` provide all additional requests
    /// that may be needed to restore the data model
    static func make(
        withUserNotificationRequest notificationRequest: UNNotificationRequest,
        requestsInSameCategory pendingNotificationRequests: [UNNotificationRequest]
    ) -> Self?
}

// MARK: - LocalNotificationRepository

public final class LocalNotificationRepository<RequestModel: NotificationRequestModelable & Modelable> {
    public var localNotificationStatePublisher: AnyPublisher<DataState.LocalNotification<RequestModel>, Never> {
        currentLocalNotificationState.eraseToAnyPublisher()
    }
    
    /// Storing the initial state
    private let currentLocalNotificationState: CurrentValueSubject<DataState.LocalNotification<RequestModel>, Never> = .init(.unauthorized)
    
    /// Category of local notification that is specific to this instance
    /// So that we don't access all local notifications scheduled by the app.
    private let category: Identifier.NotificationCategory
    
    /// Dependencies
    private let userNotificationCenter: UNUserNotificationCenter
    
    public init(category: Identifier.NotificationCategory, userNotificationCenter: UNUserNotificationCenter) {
        self.category = category
        self.userNotificationCenter = userNotificationCenter
    }
    
    @MainActor
    public func loadPendingNotifications() async {
        do {
            currentLocalNotificationState.value = try await Self.localNotificationStateAfterAdding(
                request: nil,
                category: category,
                userNotificationCenter: userNotificationCenter
            )
        } catch {
            // This catch does not means use decline notification permission.
            // Even for authorization case
            currentLocalNotificationState.value = .handledError([])
        }
    }
    
    @MainActor
    public func scheduleNotification(request: RequestModel) async {
        let previousRequest = currentLocalNotificationState.value.previousRequests
        currentLocalNotificationState.value = .waitingToAdd(request, existing: previousRequest)
        
        do {
            let authorized = try await Self.requestNotificationAuthorization(
                userNotificationCenter: userNotificationCenter
            )
            guard authorized else {
                currentLocalNotificationState.value = .unauthorized
                return
            }
            
            currentLocalNotificationState.value = try await Self.localNotificationStateAfterAdding(
                request: request,
                category: category,
                userNotificationCenter: userNotificationCenter
            )
        } catch {
            currentLocalNotificationState.value = .handledError(previousRequest)
        }
    }
    
    @MainActor
    public func cancelNotification(_ requestIdentifier: Identifier.NotificationRequest) async {
        let previousRequest = currentLocalNotificationState.value.previousRequests
        await Self.removeNotification(
            identifier: requestIdentifier.id,
            userNotificationCenter: userNotificationCenter
        )
        
        do {
            currentLocalNotificationState.value = try await Self.localNotificationStateAfterAdding(
                request: nil,
                category: category,
                userNotificationCenter: userNotificationCenter
            )
        } catch {
            currentLocalNotificationState.value = .handledError(previousRequest)
        }
    }
    
    // MARK: - Pure I/O
    
    private static func requestNotificationAuthorization(
        userNotificationCenter: UNUserNotificationCenter
    ) async throws -> Bool {
        try await userNotificationCenter.requestAuthorization(options: [.alert, .badge, .sound])
    }
    
    private static func removeNotification(
        identifier: String,
        userNotificationCenter: UNUserNotificationCenter
    ) async {
        let pendingRequests = await userNotificationCenter.pendingNotificationRequests()
        let referenceRequestId = pendingRequests
            .filter { request in
                request.content.info(for: .referenceNotificationId) == identifier
            }
            .map { request in
                request.identifier
            }
        
        let removedIdentifiers = referenceRequestId + [identifier]
        
        userNotificationCenter.removePendingNotificationRequests(withIdentifiers: removedIdentifiers)
        userNotificationCenter.removeDeliveredNotifications(withIdentifiers: removedIdentifiers)
    }
    
    private static func localNotificationStateAfterAdding(
        request: RequestModel?,
        category: Identifier.NotificationCategory,
        userNotificationCenter: UNUserNotificationCenter
    ) async throws -> DataState.LocalNotification<RequestModel> {
        
        // Queue up the requests
        // One request model may result in multiple notifications scheduled
        if let request {
            for notificationRequest in request.makeNotificationRequests(category: category) {
                try await userNotificationCenter.add(notificationRequest)
            }
        }
        
        // Query all requests (that includes the newly added request) to update the state
        let pendingRequest = await userNotificationCenter.pendingNotificationRequests()
        return .scheduled(pendingRequest
            .filter { $0.content.categoryIdentifier == category.id }
            .compactMap {
                .make(withUserNotificationRequest: $0, requestsInSameCategory: pendingRequest)
            }
        )
    }
}

// MARK: - Swift 6 Conformance

extension UNUserNotificationCenter: @retroactive @unchecked Sendable {}
