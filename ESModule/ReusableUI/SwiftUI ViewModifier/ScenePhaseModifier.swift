import SwiftUI

public extension View {
    func modifyOnScenePhase(_ scenePhase: ScenePhase, performing: @escaping () -> Void) -> some View {
        modifier(ScenePhaseModifier(observedPhase: scenePhase, didChange: performing))
    }
}

struct ScenePhaseModifier: ViewModifier {
    @Environment(\.scenePhase) var scenePhase
    
    let observedPhase: ScenePhase
    let didChange: () -> Void
    
    func body(content: Content) -> some View {
        content
            .onChange(of: scenePhase) { _, newPhase in
                if newPhase == observedPhase {
                    didChange()
                }
            }
    }
}
