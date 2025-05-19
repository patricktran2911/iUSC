import SwiftUI
import ESDataStructure
import ESLiveData
import ESDataModel

public struct ESLanguageMenuView: HashIdentifiable {
    let languages: [ESLanguageMenuViewModel.LanguageItem]
    let selectedLanguage: ValueChangedEffect<ESLanguageMenuViewModel.LanguageItem>
}

extension ESLanguageMenuView: View {
    public var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 4) {
                ForEach(languages, id: \.id) { language in
                    Button{
                        selectedLanguage.update(language)
                    } label: {
                        HStack {
                            Text(language.displayName)
                                .foregroundColor(.primary)
                                .lineLimit(1)
                                .truncationMode(.tail)
                            
                            Spacer()
                            
                            if selectedLanguage.currentValue == language {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.accentColor)
                            }
                            
                        }
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(selectedLanguage.currentValue == language ? Color.accentColor.opacity(0.1) : Color.clear)
                        )
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .padding(8)
        .frame(minWidth: 180)
    }
}

#if targetEnvironment(simulator)
#Preview {
    ESLanguageMenuView.preview()
}

public extension ESLanguageMenuView {
    static func preview() -> Self {
        .init(
            languages: .currentSupportedLanguages,
            selectedLanguage: .noEffect(.init(language: .english, hasPurchased: true))
        )
    }
}
#endif

