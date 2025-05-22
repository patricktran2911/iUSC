import SwiftUI
import ESDataStructure
import ESLiveData
import ESReusableUI
import ESLocalizer

public struct SSPickerView: HashIdentifiable {
    let usStates: [String]
    let currentSelectedState: ValueChangedEffect<String>
    let isOpenSheet: ValueChangedEffect<Bool>
}

extension SSPickerView: View {
    public var body: some View {
        HStack {
            Button(action: {
                isOpenSheet.update(true)
            }) {
                HStack(spacing: 6) {
                    Image(systemName: "location.fill")
                    Text(currentSelectedState.currentValue)
                        .fontWeight(.semibold)
                    Image(systemName: "chevron.down")
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color.gray.opacity(0.15))
                .clipShape(Capsule())
            }
            .buttonStyle(.plain)

            Spacer()
        }
        .padding(.horizontal)
        .sheet(isPresented: isOpenSheet.binding) {
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
    SSPickerView.preview()
}

public extension SSPickerView {
    static func preview() -> Self {
        .init(
            usStates: ["California", "Texas", "New York", "Florida", "Illinois", "Georgia", "Colorado"],
            currentSelectedState: .noEffect("California"),
            isOpenSheet: .noEffect(false)
        )
    }
}
#endif
