import ESDataStructure
import ESInjector
import ESLiveData
import ESDataSource
import ESLocalNotification
import ESUSCDataRepository

public final class PMContainer {

    public init() {}
    
    @_Injected(as: AnchorTime.self, required: Void.self)
    public var anchorTime
    
    @_Injected(as: USCDataRepository.self, required: Void.self)
    public var uscDataRepository
    
    @MainActor
    public lazy var practiceModeDataSource = Injected(as: PracticeModeDataSource.self, .singleton { [uscDataRepository] in
        PracticeModeRepository(uscDataRepository: uscDataRepository.resolved())
    })
}
