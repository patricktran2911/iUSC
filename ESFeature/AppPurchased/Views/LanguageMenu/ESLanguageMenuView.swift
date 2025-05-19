import SwiftUI
import ESDataStructure
import ESLiveData
import ESDataModel

public struct ESLanguageMenuView: HashIdentifiable {
    let languages: [ESLanguageMenuViewModel.LanguageItem]
    let selectedLanguage: ValueChangedEffect<ESLanguageMenuViewModel.LanguageItem>
    let unlockAction: ActionEffect
}

extension ESLanguageMenuView: View {
    public var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 6) {
                ForEach(languages, id: \.id) { language in
                    Button {
                        if language.hasPurchased {
                            selectedLanguage.update(language)
                        } else {
                            unlockAction.occurs()
                        }
                    } label: {
                        HStack {
                            Text(language.displayName)
                                .foregroundColor(.primary)
                                .fontWeight(.medium)
                                .lineLimit(1)
                                .truncationMode(.tail)

                            Spacer()

                            if !language.hasPurchased {
                                Image(systemName: "lock.fill")
                                    .foregroundColor(.gray)
                            } else if selectedLanguage.currentValue == language {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.accentColor)
                            }
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 14)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(
                                    selectedLanguage.currentValue == language && language.hasPurchased
                                    ? Color.accentColor.opacity(0.12)
                                    : Color.clear
                                )
                        )
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(12)
        }
        .frame(minWidth: 240, maxWidth: 360)
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
            selectedLanguage: .noEffect(.init(language: .english, hasPurchased: true)),
            unlockAction: .noEffect()
        )
    }
}
#endif

