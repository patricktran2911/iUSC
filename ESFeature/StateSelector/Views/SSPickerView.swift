import SwiftUI
import ESDataStructure
import ESLiveData
import ESLocalizer
import ESDataModel

public struct SSPickerView: HashIdentifiable {
    let searchedStates: [DataState.USState]
    let usStates: [DataState.USState]
    let currentSelectedState: ValueChangedEffect<DataState.USState>
    let searchBar: ObservedDataView<SSSearchBarView>
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
                    Text(currentSelectedState.currentValue.abbreviation)
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
                
                Text(ESLocalizer.text("Select Your State", table: .stateSelector))
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                
                searchBar
                    .padding(.horizontal)
                
                ScrollViewReader { reader in
                    ScrollView(showsIndicators: false) {
                        LazyVStack(spacing: 10) {
                            ForEach(searchedStates.isEmpty ? usStates : searchedStates) { state in
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
    let state: DataState.USState
    let isSelected: Bool

    var body: some View {
        HStack {
            Text(state.fullStateName.capitalized)
                .font(.body)
                .fontWeight(.medium)
                .foregroundColor(isSelected ? .green : .primary)

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
            searchedStates: [],
            usStates: [.CA, .TX, .NY, .AL, .CO],
            currentSelectedState: .noEffect(.CA),
            searchBar: .const(.preview()),
            isOpenSheet: .noEffect(false)
        )
    }
}
#endif
