import Foundation
import ESInjector

public protocol ContainerSubscriptable {
    associatedtype Container
    var container: Container { get }
}

enum MockError: Error {
    case noMockProvided
}

public extension ContainerSubscriptable {
    subscript<Dep>(_ keyPath: KeyPath<Container, Dep>) -> Dep {
        container[keyPath: keyPath]
    }
}

public extension GherkinSpec.Outcome where Context: ContainerSubscriptable {
    subscript<Dep>(_ keyPath: KeyPath<Context.Container, Dep>) -> Dep {
        context.container[keyPath: keyPath]
    }
}
