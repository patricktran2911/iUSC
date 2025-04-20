import Foundation
import Combine

/// Use this in unit test to assert on side effect
public class Mockable<Input, Output> {
    /// Asserting on the latest input, and how many times it has been recorded
    public lazy var latestValueRecorder: LatestValueRecorder<Input> = {
        spiedInput.latestValueRecorder
    }()
    
    public var latestRecordedInput: Input? {
        latestValueRecorder.currentValue
    }
    
    private let spiedInput = PassthroughSubject<Input, Never>()
    private var mockedOutput: Output
    
    public init(initial mockedOutput: Output) {
        self.mockedOutput = mockedOutput
    }
    
    /// Record the input for assertion via `latestValueRecorder`
    ///
    /// ```
    /// class MockSomeComponent {
    ///     let mockDoSomething = Mockable<String, Int>(initial: 100)
    ///
    ///     func doSomeThing(param: String) -> Int {
    ///         mockDoSomething.recordAndReturn(param)
    ///     }
    /// }
    /// ```
    public func recordAndReturn(_ input: Input) -> Output {
        spiedInput.send(input)
        return mockedOutput
    }
    
    /// mock the output to be returned
    public func setOutput(_ output: Output) {
        mockedOutput = output
    }
}

public extension Mockable where Output == Void {
    convenience init() {
        self.init(initial: ())
    }
    
    func record(_ input: Input) {
        spiedInput.send(input)
    }
}
