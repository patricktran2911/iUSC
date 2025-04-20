import ESDataStructure
import ESLiveData
import SwiftUI
import UIKit

public struct ESKeyboardSpacer: HashIdentifiable {
    let height: CGFloat
}

extension ESKeyboardSpacer: View {
    public var body: some View {
        Spacer()
            .frame(height: height)
    }
    
    @MainActor
    public static func forceKeyboardDimissal() {
        // TODO: handle this via focus state so we don't have to import UIKit
        UIWindow.currentKeyWindow?.endEditing(true)
    }
}

private extension UIWindow {
    static var currentKeyWindow: UIWindow? {
        UIApplication
            .shared
            .connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.keyWindow }
            .last
    }
}

public extension ESKeyboardSpacer {
    static func previewKeyboardSpacer(height: CGFloat = 320) -> Self {
        .init(height: height)
    }
}
