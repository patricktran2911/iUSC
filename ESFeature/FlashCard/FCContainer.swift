import ESDataStructure
import ESInjector
import ESLiveData
import ESDataSource
import ESLocalNotification
import ESUSCDataRepository
import ESSpeechService

public final class FCContainer {

    public init() {}
    
    @_Injected(as: AnchorTime.self, required: Void.self)
    public var anchorTime
    
    @_Injected(as: USCDataRepository.self, required: Void.self)
    public var uscDataRepository
    
    @_Injected(as: SpeechService.self, required: Void.self)
    public var speechService
    
    @MainActor
    public lazy var flashCardDataSource = Injected(as: FlashCardDataSource.self, .singleton { [uscDataRepository] in
        FlashCardRepository(
            uscDataSource: uscDataRepository.resolved(),
            speechService: self.speechService.resolved()
        )
    })
    
    public lazy var selectedDateDataSource = Injected(as: SelectedDateDataSource.self, .singleton {
        SelectedDateRepository()
    })
}
