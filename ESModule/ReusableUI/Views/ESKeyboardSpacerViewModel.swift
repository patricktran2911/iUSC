import ESLiveData
import Combine
import Foundation
import UIKit

public final class ESKeyboardSpacerViewModel: StreamViewModel<ESKeyboardSpacer> {
    public init() {
        super.init(statePublisher: ESKeyboardSpacer.keyboardHeightPublisher
            .map { height in
                if height > 0 {
                    return .loaded(ESKeyboardSpacer(height: height))
                } else {
                    return .hidden
                }
            }
            .eraseToAnyPublisher()
        )
    }
}

public extension ESKeyboardSpacer {
    /// Update keyboard height as keyboard becomes active
    static var keyboardActiveHeightPublisher: AnyPublisher<CGFloat, Never> {
        return NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
            .map { notification in
                if let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                    return keyboardRect.height
                }
                
                return CGFloat(0)
            }
            .eraseToAnyPublisher()
    }
    
    /// Update keyboard height as keyboard becomes active / inactive with an initial value is inactive
    static var keyboardHeightPublisher: AnyPublisher<CGFloat, Never> {
        
        let keyboardInactive = NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in return CGFloat(0) }
        
        return Self.keyboardActiveHeightPublisher
            .merge(with: keyboardInactive)
            .eraseToAnyPublisher()
    }
}
