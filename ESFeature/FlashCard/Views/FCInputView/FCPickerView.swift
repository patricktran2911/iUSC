import SwiftUI
import ESDataStructure
import ESLiveData

public struct FCDatePickerView: HashIdentifiable {
    let selectedDate: ValueChangedEffect<Date>
}

extension FCDatePickerView: View {
    public var body: some View {
        DatePicker("", selection: selectedDate.binding, displayedComponents: [.date, .hourAndMinute])
            .labelsHidden()
            .datePickerStyle(WheelDatePickerStyle())
            .frame(maxWidth: .infinity)
    }
}

#if targetEnvironment(simulator)
#Preview(".date picker view") {
    FCDatePickerView.previewDatePickerView()
}

public extension FCDatePickerView {
    static func previewDatePickerView() -> Self {
        .init(selectedDate: .noEffect(.now))
    }
}
#endif

