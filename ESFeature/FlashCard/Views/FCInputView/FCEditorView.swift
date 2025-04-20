import SwiftUI
import ESDataStructure

/// Calendar widget
/// Time widget
public struct FCInputEditorView: HashIdentifiable {
    
}

extension FCInputEditorView: View {
    public var body: some View {
        EmptyView()
    }
}

#if targetEnvironment(simulator)
#Preview(".editor view") {
    FCInputEditorView.previewInputEditorView()
}

public extension FCInputEditorView {
    static func previewInputEditorView() -> Self {
        .init()
    }
}
#endif

