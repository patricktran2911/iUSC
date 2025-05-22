import Combine
import ESLiveData
import ESDataModel
import ESDataSource

public final class SSPickerViewModel: StreamViewModel<SSPickerView> {
    @MainActor
    public init(repository: StateSelectorDataSource) {
        let currentStateSelectedPublisher = repository.currentUSStatePublisher
        let openSheetValue = CurrentValueSubject<Bool, Never>(false)
        let allStates = DataState.USState.allCases.map(\.abbreviation)
        let combinedPublisher = Publishers.CombineLatest(currentStateSelectedPublisher, openSheetValue)
        
        super.init(
            dataViewPublisher: combinedPublisher
                .map { currentStateSelected, isOpenSheet in
                    SSPickerView(
                        usStates: allStates,
                        currentSelectedState: .onUpdated(
                            fromInitial: currentStateSelected.abbreviation,
                            action: { newValue in
                                repository.updateState(.init(rawValue: "area_" + newValue) ?? .CA)
                                openSheetValue.value = false
                            }
                        ),
                        isOpenSheet: .onUpdated(fromInitial: isOpenSheet, action: { newValue in
                            openSheetValue.value = newValue
                        })
                    )
                }
                .eraseToAnyPublisher()
        )
    }
}

