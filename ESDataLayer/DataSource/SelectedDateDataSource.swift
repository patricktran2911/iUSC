import Combine
import Foundation
import ESDataModel

public protocol SelectedDateDataSource {
    var selectedDatePublisher: CurrentValueSubject<Date?, Never> { get }
    var inputTextPublisher: CurrentValueSubject<String?, Never> { get }
    
    func updateDate(newSelectedDate: Date?)
    func updateInputText(newInputText: String?)
    func clearInputText()
}
