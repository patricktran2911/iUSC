import SwiftUI
import ESDataStructure
import ESLiveData
import ESReusableUI
import ESLocalizer

public struct PMUSStatePickerView: HashIdentifiable {
    let usStates: [String]
    let currentSelectedState: ValueChangedEffect<String>
}

extension PMUSStatePickerView: View {
    public var body: some View {
        VStack(spacing: 16) {
            Text(ESLocalizer.text("Select Your State", table: .practiceMode))
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top, 20)

            ScrollViewReader { reader in
                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: 10) {
                        ForEach(usStates, id: \String.self) { state in
                            StateRow(
                                state: state,
                                isSelected: state == currentSelectedState.currentValue
                            )
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.25)) {
                                    currentSelectedState.update(state)
                                }
                            }
                            .tag(state)
                        }
                    }
                    .padding()
                }
                .onAppear {
                    withAnimation(.easeInOut) {
                        reader.scrollTo(currentSelectedState.currentValue, anchor: .center)
                    }
                }
            }

            Spacer()
        }
        .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
    }
}

private struct StateRow: View {
    let state: String
    let isSelected: Bool

    var body: some View {
        HStack {
            Text(state)
                .font(.body)
                .fontWeight(.medium)
                .foregroundColor(isSelected ? .green : .primary)
                .textCase(.uppercase)

            Spacer()

            if isSelected {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12)
            .fill(isSelected ? Color.green.opacity(0.15) : Color(.secondarySystemBackground)))
        .shadow(color: Color.black.opacity(0.04), radius: 2, x: 0, y: 1)
    }
}

#if targetEnvironment(simulator)
#Preview {
    PMUSStatePickerView.preview()
}

extension PMUSStatePickerView {
    public static func preview() -> Self {
        .init(
            usStates: ["California", "Texas", "New York", "Florida", "Illinois", "Georgia", "Colorado"],
            currentSelectedState: .noEffect("California")
        )
    }
}
#endif
