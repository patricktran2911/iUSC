import SwiftUI
import ESDataStructure
import ESLiveData
import ESReusableUI
import ESLocalizer

struct SSSearchBarView: HashIdentifiable {
    let searchText: ValueChangedEffect<String>
}

extension SSSearchBarView: View {
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)

            TextField(ESLocalizer.text("Search...", table: .stateSelector), text: searchText.binding)
                .foregroundColor(.primary)

            if !searchText.currentValue.isEmpty {
                Button(action: {
                    searchText.update("")
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
                .transition(.opacity)
            }
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color(UIColor.tertiarySystemFill))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(UIColor.quaternaryLabel), lineWidth: 0.5)
        )
        .padding(.horizontal)
        .animation(.easeInOut(duration: 0.2), value: searchText.currentValue)
    }
}


#if targetEnvironment(simulator)
#Preview {
    SSSearchBarView.preview()
}

extension SSSearchBarView {
    static func preview() -> Self {
        .init(searchText: .noEffect("California"))
    }
}
#endif
