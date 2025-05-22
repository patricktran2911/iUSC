import Combine
import ESLiveData
import ESDataModel
import ESDataSource

final class SSSearchBarViewModel: StreamViewModel<SSSearchBarView> {
    @MainActor
    public init(repository: StateSelectorDataSource) {
        super.init(
            dataViewPublisher: repository.currentSearchTextPublisher.map { text in
                SSSearchBarView(
                    searchText: .onUpdated(fromInitial: text, action: { newValue in
                        repository.updateSearchBar(newValue)
                    }))
            }.eraseToAnyPublisher()
        )
    }
}

