import SwiftUI
import ESDataStructure
import ESLiveData
import ESReusableUI

struct PMUSStatePickerView: HashIdentifiable {
    let usStates: [String]
    let currentSelectedState: ValueChangedEffect<String>
}

extension PMUSStatePickerView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Select Your State")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top, 24)
            
            ScrollViewReader { reader in
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(usStates, id: \.self) { state in
                            Button {
                                currentSelectedState.update(state)
                            } label: {
                                HStack {
                                    Text(state)
                                        .font(.body)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.primary)
                                        .textCase(.uppercase)
                                    
                                    Spacer()
                                    
                                    if currentSelectedState.currentValue == state {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(.green)
                                            .imageScale(.medium)
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.vertical, 14)
                                .background(
                                    RoundedRectangle(cornerRadius: 14)
                                        .fill(currentSelectedState.currentValue == state ? Color.green.opacity(0.1) : Color(.systemBackground))
                                        .shadow(color: .black.opacity(0.05), radius: 3, x: 0, y: 1)
                                )
                            }
                            .tag(state)
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 32)
                }
                .onChange(of: currentSelectedState.currentValue) { _, newValue in
                    reader.scrollTo(newValue, anchor: .center)
                }
            }
        }
        .padding(.horizontal)
        .background(Color(.systemGroupedBackground))
    }
}


#if targetEnvironment(simulator)
#Preview {
    PMUSStatePickerView.preview()
}

extension PMUSStatePickerView {
    static func preview() -> Self {
        .init(
            usStates: ["area_CA", "area_TX", "area_NY", "area_FL"],
            currentSelectedState: .noEffect("area_CA")
        )
    }
}
#endif

