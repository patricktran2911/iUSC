import ESDataStructure
import ESInjector
import ESLiveData
import ESDataSource
import ESLocalNotification

public final class FCContainer {

    public init() {}
    
    @_Injected(as: AnchorTime.self, required: Void.self)
    public var anchorTime
    
    public lazy var flashCardDataSource = Injected(as: FlashCardDataSource.self, .singleton {
        FlashCardRepository(userDefaults: .standard)
    })
    
    public lazy var selectedDateDataSource = Injected(as: SelectedDateDataSource.self, .singleton {
        SelectedDateRepository()
    })
}
