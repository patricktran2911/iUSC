import SwiftUI
import ESDataStructure
import ESLiveData
import ESReusableUI

/// List of previous memo
public struct FCListView: HashIdentifiable {
    let fcList: [ObservedDataView<FCItemView>]
    let appearAction: ActionEffect
    let sceneActiveAction: ActionEffect
    let currentIndex: ValueChangedEffect<Int>
}

extension FCListView: View {
    public var body: some View {
        VStack(alignment: .center) {
            TabView(selection: currentIndex.binding) {
                ForEach(0..<fcList.count, id: \.self) { index in
                    fcList[index]
                        .tag(index)
                }
            }
            .frame(minHeight: 100)
            .tabViewStyle(.page(indexDisplayMode: .never))
                        
            if !fcList.isEmpty {
                ScrollView(.horizontal) {
                    HStack(alignment: .center, spacing: 4) {
                        ForEach(0..<fcList.count, id: \.self) { index in
                            let isSelected = index == currentIndex.currentValue
                            Circle()
                                .fill(Color.blue)
                                .opacity(isSelected ? 0.7 : 0.3)
                                .frame(width: isSelected ? 10 : 8, height: isSelected ? 10 : 8)
                                .tag(index)
                        }
                    }
                    // Offset calculating total width is 42 => offset = 42/2 + 4(half of circle) - 2 (half of padding) = 18
                    .offset(x: CGFloat(currentIndex.currentValue * -12 + 18))
                }
                .frame(width: 4*4 + 8*2 + 10, height: 10)
                .padding(.all, 4)
                .animation(.linear(duration: 0.2), value: currentIndex)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.3))
                }
            }
        }
        .onAppear {
            appearAction.occurs()
        }
        .modifyOnScenePhase(.active) {
            sceneActiveAction.occurs()
        }
    }
}

#if targetEnvironment(simulator)
#Preview(".list view") {
    FCListView.previewListView()
    
}

public extension FCListView {
    static func previewListView() -> Self {
        FCListView(
            fcList:[
                .stateless(.previewItemView(isEditting: false)),
                .stateless(.previewItemView(isEditting: true))
            ],
            appearAction: .noEffect(),
            sceneActiveAction: .noEffect(),
            currentIndex: .noEffect(0)
        )
    }
}
#endif
