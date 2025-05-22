import Combine
import ESLiveData
import ESDataModel
import ESDataSource

public final class SSPickerViewModel: StreamViewModel<SSPickerView> {
    @MainActor
    public init(repository: StateSelectorDataSource) {
        let currentStateSelectedPublisher = repository.currentUSStatePublisher
        let openSheetValue = CurrentValueSubject<Bool, Never>(false)
        let searchStatesPublisher = repository.stateSearchPublisher
        let allStates = DataState.USState.allCases
        let combinedPublisher = Publishers.CombineLatest3(currentStateSelectedPublisher, openSheetValue, searchStatesPublisher)
        
        super.init(
            dataViewPublisher: combinedPublisher
                .map { currentStateSelected, isOpenSheet, searchStates in
                    SSPickerView(
                        searchedStates: searchStates,
                        usStates: allStates,
                        currentSelectedState: .onUpdated(
                            fromInitial: currentStateSelected,
                            action: { newValue in
                                repository.updateState(newValue)
                                openSheetValue.value = false
                            }
                        ),
                        searchBar: .viewObserved(stream: SSSearchBarViewModel(repository: repository)),
                        isOpenSheet: .onUpdated(fromInitial: isOpenSheet, action: { newValue in
                            openSheetValue.value = newValue
                        })
                    )
                }
                .eraseToAnyPublisher()
        )
    }
}

