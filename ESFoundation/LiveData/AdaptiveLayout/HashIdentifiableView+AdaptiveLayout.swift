import SwiftUI

/// Sizeclass correlation with device layout
/// https://developer.apple.com/design/human-interface-guidelines/layout
public enum AdaptiveLayout {
    case main
    case regularWidthHeight
    case compactHeight
}

extension LiveData where Value: HashIdentifiableView {
    
    /// This is for internal usage.
    /// rendering an observable view when the `DataView` changed.
    @ViewBuilder @MainActor
    func observedAdaptiveLayout<TransformedView: View>(@ViewBuilder _ transformation: @escaping (Value, AdaptiveLayout) -> TransformedView) -> some View {
        ObservableAdaptiveDataView(liveData: self, transformation: transformation)
    }
    
    /// This view will be redrawn
    /// - when the data it observes changed
    /// - when the size class changed
    private struct ObservableAdaptiveDataView<V: HashIdentifiableView, TransformedView: View>: View {
        @ObservedObject var liveData: LiveData<V>
        
        /// Good read: https://github.com/renaudjenny/SwiftUI-with-Size-Classes
        @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
        @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
        
        private var adaptiveLayoutFromSizeClass: AdaptiveLayout {
            if verticalSizeClass == .regular && horizontalSizeClass == .regular {
                return .regularWidthHeight
            } else if verticalSizeClass == .compact {
                return .compactHeight
            }
            
            return .main
        }
        
        /// When the view redrawn, whichever content creating by this closure
        /// will be rendered
        let transformation: (V, AdaptiveLayout) -> TransformedView
        
        var body: some View {
            transformation(liveData.latestValue, adaptiveLayoutFromSizeClass)
        }
    }
}
