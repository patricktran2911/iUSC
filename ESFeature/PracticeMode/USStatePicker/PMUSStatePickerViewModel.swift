import Combine
import ESLiveData
import ESDataModel
import ESDataSource

final class PMUSStatePickerViewModel: StreamViewModel<PMUSStatePickerView> {
    @MainActor
    public init(container: PMContainer) {
        let pmDataSource = container.practiceModeDataSource.resolved()
        let currentStateSelectedPublisher = pmDataSource.currentAreaTestPublisher
        let allStates = DataState.USState.allCases.map(\.abbreviation)
        super.init(
            dataViewPublisher: currentStateSelectedPublisher
                .map { currentStateSelected in
                    PMUSStatePickerView(
                        usStates: allStates,
                        currentSelectedState: .onUpdated(fromInitial: currentStateSelected?.abbreviation ?? "CA", action: { newValue in
                            pmDataSource.updateTestState(.init(rawValue: "area_" + newValue) ?? .CA)
                        })
                    )
                }
                .eraseToAnyPublisher()
        )
    }
}

