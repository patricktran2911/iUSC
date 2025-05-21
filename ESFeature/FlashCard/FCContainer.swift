import ESDataStructure
import ESInjector
import ESLiveData
import ESDataSource
import ESLocalNotification
import ESUSCDataRepository

public final class FCContainer {

    public init() {}
    
    @_Injected(as: AnchorTime.self, required: Void.self)
    public var anchorTime
    
    @_Injected(as: USCDataRepository.self, required: Void.self)
    public var uscDataRepository
    
    @MainActor
    public lazy var flashCardDataSource = Injected(as: FlashCardDataSource.self, .singleton { [uscDataRepository] in
        FlashCardRepository(uscDataSource: uscDataRepository.resolved())
    })
    
    public lazy var selectedDateDataSource = Injected(as: SelectedDateDataSource.self, .singleton {
        SelectedDateRepository()
    })
}
