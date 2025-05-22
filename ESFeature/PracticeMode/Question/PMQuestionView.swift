import SwiftUI
import ESDataStructure
import ESLiveData
import ESLocalizer

enum PMQuestionView: HashIdentifiable {
    case noQuestion
    case question(
        singleAnswerView: ObservedDataView<PMSingleAnswerView>,
        multipleAnswerView: ObservedDataView<PMMultipleAnswerView>,
        freeAnswerView: ObservedDataView<PMFreeAnswerView>
    )
}

extension PMQuestionView: View {
    var body: some View {
        switch self {
        case .noQuestion:
            VStack {
                Spacer()
                Text(ESLocalizer.text("No Question Available", table: .practiceMode))
                    .font(.title2)
                    .foregroundColor(.gray)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemGroupedBackground))

        case let .question(singleAnswer, multipleAnswer, freeAnswer):
            VStack(spacing: 0) {
                ZStack {
                    singleAnswer
                    multipleAnswer
                    freeAnswer
                }
            }
        }
    }
}

#if targetEnvironment(simulator)
#Preview {
    PMQuestionView.preview()
}

extension PMQuestionView {
    static func preview() -> Self {
        .question(
            singleAnswerView: .hidden,
            multipleAnswerView: .const(.preview()),
            freeAnswerView: .hidden)
    }
}
#endif
