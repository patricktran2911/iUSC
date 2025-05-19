import SwiftUI
import ESDataStructure
import ESLiveData
import ESDataModel

public struct ESLanguageMenuView: HashIdentifiable {
    let languages: [ESLanguageMenuViewModel.LanguageItem]
    let selectedLanguage: ValueChangedEffect<ESLanguageMenuViewModel.LanguageItem>
    let unlockAction: ActionEffect
    let onProcessingPurchase: Bool
}

extension ESLanguageMenuView: View {
    public var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(languages, id: \.id) { language in
                        let isSelected = selectedLanguage.currentValue == language
                        let isLocked = !language.hasPurchased

                        Button {
                            if !isLocked {
                                selectedLanguage.update(language)
                            } else {
                                unlockAction.occurs()
                            }
                        } label: {
                            HStack(spacing: 12) {
                                Text(language.displayName)
                                    .font(.system(size: 16, weight: isSelected ? .semibold : .regular))
                                    .foregroundColor(isLocked ? .gray : .primary)
                                    .lineLimit(1)
                                    .truncationMode(.tail)

                                Spacer()

                                if isLocked {
                                    Image(systemName: "lock.fill")
                                        .foregroundColor(.gray)
                                } else if isSelected {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.accentColor)
                                }
                            }
                            .padding(.vertical, 12)
                            .padding(.horizontal, 16)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(
                                        isSelected
                                        ? Color.accentColor.opacity(0.15)
                                        : Color(UIColor.secondarySystemBackground)
                                    )
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .strokeBorder(
                                        isSelected ? Color.accentColor : Color.clear,
                                        lineWidth: isSelected ? 1.5 : 0
                                    )
                            )
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(16)
            }
            .frame(minWidth: 260, maxWidth: 400)

            if onProcessingPurchase {
                Color.black.opacity(0.25)
                    .ignoresSafeArea()
                    .blur(radius: 2)

                VStack(spacing: 12) {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .accentColor))
                        .scaleEffect(1.2)
                    Text("Processing…")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color(.systemBackground))
                        .shadow(radius: 8)
                )
            }
        }
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
            unlockAction: .noEffect(),
            onProcessingPurchase: false
        )
    }
}
#endif

