import Foundation
import SwiftUI
import UIKit
import Combine
import ESDataStructure
import ESLiveData
import ESDataModel
import ESDataSource

final class FCInputViewModel: StreamViewModel<FCInputView> {
    @MainActor
    public init(container: FCContainer) {
        let selectedDate = container.selectedDateDataSource.resolved()
        
        super.init(dataViewPublisher: selectedDate.selectedDatePublisher
            .map { date in
                FCInputView(
                    editorButton: .init(actionEffect: .performing {
                        withAnimation {
                            container.selectedDateDataSource.resolved().updateDate(
                                newSelectedDate: container.anchorTime.resolved().now
                            )
                            
                            // TODO: handle this via focus state so we don't have to import UIKit
                            UIWindow.currentKeyWindow?.endEditing(true)
                        }
                    }),
                    inputTextField: .viewObserved(stream: FCInputTextFieldViewModel(
                        container: container
                    )),
                    datePickerView: .viewObserved(stream: FCDatePickerViewModel(
                        container: container
                    ))
                )
            }
            .eraseToAnyPublisher()
        )
    }
}

final class FCDatePickerViewModel: StreamViewModel<FCDatePickerView> {
    public init(container: FCContainer) {
        let datePickerStatePublisher = container.selectedDateDataSource.resolved().selectedDatePublisher
        let visibleState = Publishers.CombineLatest(Self.keyboardActivePublisher, datePickerStatePublisher)
        
        super.init(statePublisher: visibleState
            .map { keyboarActive, selectedDate in
                withAnimation {
                    guard !keyboarActive && selectedDate != nil else {
                        return .hidden
                    }
                    
                    return .loaded(FCDatePickerView(
                        selectedDate: .onChanged(fromInitial: selectedDate!) { _, updatedDate in
                            container.selectedDateDataSource.resolved().updateDate(newSelectedDate: updatedDate)
                        }
                    ))
                }
                
                
            }
            .eraseToAnyPublisher()
        )
    }
    
    private static var keyboardActivePublisher: AnyPublisher<Bool, Never> {
        let initialInActive = Just(false).eraseToAnyPublisher()
        
        let keyboardActive = NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
            .map { _ in return true }
        
        let keyboardInactive = NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in return false }
        
        return initialInActive
            .merge(with: keyboardActive)
            .merge(with: keyboardInactive)
            .eraseToAnyPublisher()
    }
}
