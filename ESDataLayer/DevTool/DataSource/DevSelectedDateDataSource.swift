import Combine
import Foundation
import ESDataSource
import ESDataModel

public final class DevSelectedDateDataSource: SelectedDateDataSource {
    public var selectedDatePublisher: CurrentValueSubject<Date?, Never> = .init(nil)
    public var inputTextPublisher: CurrentValueSubject<String?, Never> = .init(nil)
    
    public init() {}
    
    public func updateDate(newSelectedDate: Date?) {
        selectedDatePublisher.value = newSelectedDate
    }
    
    public func updateInputText(newInputText: String?) {
        inputTextPublisher.value = newInputText
    }
    
    public func clearInputText() {
        inputTextPublisher.value = nil
    }
    
}
