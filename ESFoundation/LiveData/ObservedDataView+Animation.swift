import SwiftUI

public extension ObservedDataView {
    @ViewBuilder @MainActor
    func onStateChangeAnimate(_ animation: Animation, transition: AnyTransition) -> some View {
        switch self {
        case .stateless, .hidden:
            self
        case .stateful(let liveData):
            AnimatableContentView(liveData: liveData, animation: animation, transition: transition)
        }
    }
}

struct AnimatableContentView<DV: HashIdentifiableView>: View {
    @ObservedObject var liveData: LiveData<DV>

    let animation: Animation
    let transition: AnyTransition

    var body: some View {
        liveData.latestValue
            .transition(transition)
            .animation(animation, value: liveData.latestValue)
    }
}
