import Combine
import SwiftUI
import UIKit // Should remove this
import ESDataStructure
import ESLiveData
import ESDataModel
import ESDataSource

final class FCInputTextFieldViewModel: StreamViewModel<FCInputTextField> {
    @MainActor
    public init(container: FCContainer) {
        let selectedDateDataSource =  container.selectedDateDataSource.resolved()
        
        let statePublisher = Publishers.CombineLatest(
            selectedDateDataSource.inputTextPublisher,
            selectedDateDataSource.selectedDatePublisher
        )
        
        super.init(dataViewPublisher: statePublisher
            .map { typingText, userSelectedDate in
                if let userSelectedDate {
                    return withAnimation {
                        FCInputTextField.withDatePicker(.init(
                            placeHolder: Self.placeholder(),
                            textFieldIcon: Self.textFieldIcon(
                                for: typingText
                            ),
                            textChanged: Self.onTextChanged(
                                container: container,
                                currentText: typingText
                            ),
                            selectedDate: .onChanged(fromInitial: userSelectedDate) { _, newDate in
                                selectedDateDataSource.updateDate(newSelectedDate: newDate)
                            },
                            sendAction: Self.sendAction(
                                container: container,
                                currentText: typingText,
                                userSelectedDate: userSelectedDate
                            ),
                            closeAction: .performing {
                                withAnimation(.smooth(duration: 0.5)) {
                                    container.selectedDateDataSource.resolved().updateDate(newSelectedDate: nil)
                                }
                            }
                        ))
                    }
                    
                } else {
                    return withAnimation {
                        FCInputTextField.normal(.init(
                            placeHolder: Self.placeholder(),
                            textFieldIcon: Self.textFieldIcon(
                                for: typingText
                            ),
                            textChanged: Self.onTextChanged(
                                container: container,
                                currentText: typingText
                            ),
                            sendAction: Self.sendAction(
                                container: container,
                                currentText: typingText,
                                userSelectedDate: userSelectedDate
                            ),
                            voiceAction: .noEffect()
                        ))
                    }
                }
            }
            .eraseToAnyPublisher()
        )
    }
    
    private static func placeholder() -> String {
        String(localized: "Enter a memo")
    }
    
    private static func textFieldIcon(for currentText: String?) -> TextFieldIcon {
        (currentText == "" || currentText == nil) ? .voice : .send
    }
    
    @MainActor
    private static func onTextChanged(
        container: FCContainer,
        currentText: String?
    ) -> ValueChangedEffect<String> {
        
        .onChanged(fromInitial: currentText ?? "") { _, newValue in
            container.selectedDateDataSource.resolved().updateInputText(newInputText: newValue)
        }
    }
    
    @MainActor
    private static func sendAction(
        container: FCContainer,
        currentText: String?,
        userSelectedDate: Date?
    ) -> ActionEffect {
        
        .performing {            
            await container.flashCardDataSource.resolved().addFlashCard(
                .init(
                    uniqueId: .randomGenerated,
                    category: "General",
                    question: "",
                    answer: "",
                    isEditing: true
                )
            )
            
            container.selectedDateDataSource.resolved().updateInputText(newInputText: "")
            
            // TODO: handle this via focus state so we don't have to import UIKit
            UIWindow.currentKeyWindow?.endEditing(true)
        }
    }
}

extension UIWindow {
    static var currentKeyWindow: UIWindow? {
        UIApplication
            .shared
            .connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.keyWindow }
            .last
    }
}
