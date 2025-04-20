import SwiftUI
import BottomSheet

public extension View {
    /// Configure a static bottom sheet that don't support dragging
    /// However, the container will resize based on the instrinsic content size of `BottomSheetContent`
    func modifyStaticBottomSheet<BottomSheetContent: View>(
        @ViewBuilder contentBuilder: @escaping () -> BottomSheetContent
    ) -> some View {
        modifier(
            BottomSheetModifier(
                bottomSheetPosition: .dynamic,
                headerBuilder: { EmptyView() },
                contentBuilder: contentBuilder
            )
        )
    }
}

struct BottomSheetModifier<Header: View, BottomSheetContent: View>: ViewModifier {
    @State var bottomSheetPosition: BottomSheetPosition
    
    let headerBuilder: () -> Header
    let contentBuilder: () -> BottomSheetContent
    
    func body(content: Content) -> some View {
        content
            .bottomSheet(
                bottomSheetPosition: $bottomSheetPosition,
                switchablePositions: [],
                headerContent: headerBuilder,
                mainContent: contentBuilder
            )
            .showDragIndicator(false)
            .enableContentDrag(false)
            .enableFlickThrough(false)
            .customBackground(Color.clear, alignment: .center)
    }
}
