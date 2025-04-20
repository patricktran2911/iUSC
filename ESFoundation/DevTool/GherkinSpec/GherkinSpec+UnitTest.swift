import Foundation

/// Namespacing for unit tests on a single component
public enum UnitTest {
    public static func given<Context>(_ context: () throws -> Context) rethrows -> GivenContext<Context> {
        .init(context: try context())
    }
    
    public static func given<Context>(_ context: () async throws -> Context) async rethrows -> GivenContext<Context> {
        .init(context: try await context())
    }
}

// MARK: - Convenient Container Support

public typealias GivenContainerContext<Container, Context>  = GivenContext<ContainerContext<Container, Context>>
public typealias WhenContainerOutcome<Container, OutCome>   = WhenOutcome<ContainerContext<Container, OutCome>, Void>
public typealias ThenContainerOutcome<Container, OutCome>   = ThenOutcome<ContainerContext<Container, OutCome>>

public struct ContainerContext<Container, SUT>: ContainerSubscriptable {
    public let container: Container
    public let sut: SUT
}

public extension UnitTest {
    static func given<Container, SUT>(
        container: Container,
        _ context: (Container) throws -> SUT
    ) rethrows -> GivenContainerContext<Container, SUT> {
        .init(context: .init(container: container, sut: try context(container)))
    }
    
    static func given<Container, SUT>(
        container: Container,
        _ context: (Container) async throws -> SUT
    ) async rethrows -> GivenContainerContext<Container, SUT> {
        .init(context: .init(container: container, sut: try await context(container)))
    }
}
