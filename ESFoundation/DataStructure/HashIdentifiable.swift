import Foundation

/// Convenient protocol to remove redundant `Identifiable` implementation
/// Conforming SwiftUI view struct/enum to this protocol also provides unit test benefit.
/// The `Hashable` requirement is our MVVM specific implementation.
/// The `Identifiable` is what SwiftUI will require if we use `ForEach`
public typealias HashIdentifiable = Hashable & Identifiable

/// Since every SwiftUI view in our MVVM ecosystem is required to be `Hashable`
/// The `Identifable` requirement can come for-free.
extension Identifiable where Self: Hashable {
    public var id: Self {
        self
    }
}

/// UniqueHash is only required if the SwiftUI view is part of a collection.
/// And the information it contains is not uniquely identified.
public typealias UniqueHash = String

public extension UniqueHash {
    /// Just use this whenever UniqueHash is required.
    static var hashableUUID: Self {
        UUID().uuidString
    }
}

public extension UniqueHash {
    /// Use internally for our MVVM implementation,
    /// In the future this may be overriden for unit test purpose.
    /// So don't use this in any of your SwiftUI view.
    static var componentUniqueHash: Self {
        UUID().uuidString
    }
    
    static var constantHash: Self {
        #function
    }
}
