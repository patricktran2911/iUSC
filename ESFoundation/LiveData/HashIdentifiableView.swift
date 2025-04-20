import SwiftUI
import ESDataStructure

/// A SwiftUI View that conforms to `HashIdentifiable`
/// This is the basic view unit for our MVVM structure.
public typealias HashIdentifiableView = View & HashIdentifiable

extension LiveData where Value: HashIdentifiableView {
    
    /// Building a view that would be refreshed when the `latestValue` updated.
    /// This is the glue for our MVVM implementation. Instead of having to manually create a view binded to viewModel,
    /// simply use this function within any SwiftUI view structure.
    /// It also helps guarantee that `StateObject` creation only happen within the view's body
    /// This function is being fronted by `ObservedDataView` for convenience, so intentionally not exposed publicly.
    @ViewBuilder 
    func observedDataView() -> some View {
        ObservableDataView(liveData: self)
    }
    
    @ViewBuilder @MainActor
    func observedDataView<TransformedView: View>(@ViewBuilder _ transformation: @escaping (Value) -> TransformedView) -> some View {
        ObservableTransformedDataView(liveData: self, transformation: transformation)
    }
    
    private struct ObservableDataView<V: HashIdentifiableView>: View {
        @ObservedObject var liveData: LiveData<V>
        
        var body: some View {
            liveData.latestValue
        }
    }
    
    private struct ObservableTransformedDataView<V: HashIdentifiableView, TransformedView: View>: View {
        @ObservedObject var liveData: LiveData<V>
        
        let transformation: (V) -> TransformedView
        
        var body: some View {
            transformation(liveData.latestValue)
        }
    }
}
