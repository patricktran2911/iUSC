import ESDataStructure
import ESInjector
import ESLiveData
import ESDataSource
import ESLocalNotification

public final class PMContainer {

    public init() {}
    
    @_Injected(as: AnchorTime.self, required: Void.self)
    public var anchorTime
    
    public lazy var practiceModeDataSource = Injected(as: PracticeModeDataSource.self, .singleton {
        PracticeModeRepository()
    })
}
