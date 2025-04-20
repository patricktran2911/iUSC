import SwiftUI
import ESDataStructure

struct PriorityRingView: HashIdentifiable {
    let priorityColor: Color.ESPriority
}

extension PriorityRingView: View {
    public var body: some View {
        Circle()
            .stroke(style: StrokeStyle(lineWidth: 4))
            .frame(width: 32, height: 32)
            .foregroundStyle(esColor: priorityColor.color)
    }
}

#if targetEnvironment(simulator)
#Preview(".all") {
    VStack(spacing: 20) {
        ForEach(Color.ESPriority.allCases) {
            PriorityRingView.previewPriority($0)
        }
    }
}

extension PriorityRingView {
    static func previewPriority(_ color: Color.ESPriority = .expired) -> Self {
        .init(priorityColor: color)
    }
}
#endif
