import Combine
import Foundation
import ESLocalizer
import ESDataSource
import ESDataModel
import FirebaseRemoteConfig
import ESStateSelector // Use for currentState UserDefault

public final class USCDataRepository: USCDataSource {
    private static func observeUSStateChange() -> AnyPublisher<DataModel.USStateOfficers?, Never> {
        let remote = RemoteConfig.remoteConfig()
        return UserDefaults.standard.publisher(for: \.currentState).map {
            let selectedState = DataState.USState(rawValue: $0)
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let president = try remote["president"].decoded(asType: DataModel.USStateOfficers.USOfficer.self)
                let vicePresident = try remote["vice_president"].decoded(asType: DataModel.USStateOfficers.USOfficer.self)
                let chiefJustice = try remote["chief_justice"].decoded(asType: DataModel.USStateOfficers.USOfficer.self)
                let speakerOfTheHouse = try remote["speaker_of_the_house"].decoded(asType: DataModel.USStateOfficers.USOfficer.self)
                let stateOfficers = try remote[selectedState?.rawValue ?? "area_CA"].decoded(asType: DataModel.USStateOfficers.USStateOfficers.self)
                return .init(
                    president: president,
                    vicePresident: vicePresident,
                    chiefJustice: chiefJustice,
                    speakerOfTheHouse: speakerOfTheHouse,
                    stateOfficers: stateOfficers)
            } catch {
                print(error.localizedDescription)
                return nil
            }
        }
        .eraseToAnyPublisher()
    }

    public var currentOfficersPublisher: AnyPublisher<DataModel.USStateOfficers, Never> {
        Self.observeUSStateChange().compactMap({$0}).eraseToAnyPublisher()
    }
    
    public var uscis100QuestionsPublisher: AnyPublisher<[DataModel.QuestionDecoded], Never> {
        Publishers.CombineLatest(currentOfficersPublisher, Self.dataPublisher())
            .map { currentOfficer, questions in
                self.adjustQuestions(officers: currentOfficer, questions: questions)
            }
            .eraseToAnyPublisher()
    }
    
    
    public init() {}
    
    
    private func adjustQuestions(
        officers: DataModel.USStateOfficers,
        questions: [DataModel.QuestionDecoded]) -> [DataModel.QuestionDecoded] {
            questions.map {
                if $0.question.contains(ESLocalizer.text("What is the name of the President of the United States now?", table: .dataModel))  {
                    return $0.updatingCorrectAnswers(officers.president.names)
                }
                if $0.question.contains(ESLocalizer.text("What is the name of the Vice President of the United States now?", table: .dataModel))  {
                    return $0.updatingCorrectAnswers(officers.vicePresident.names)
                }
                if $0.question.contains(ESLocalizer.text("Who is one of your state U.S. Senators now?", table: .dataModel)) {
                    return $0.updatingCorrectAnswers(officers.stateOfficers.senators)
                }
                if $0.question.contains(ESLocalizer.text("Who is the Governor of your state now?", table: .dataModel))  {
                    return $0.updatingCorrectAnswers([officers.stateOfficers.governor])
                }
                if $0.question.contains(ESLocalizer.text("What is the capital of your state?", table: .dataModel))  {
                    return $0.updatingCorrectAnswers([officers.stateOfficers.capital])
                }
                if $0.question.contains(ESLocalizer.text("Who is the Chief Justice of the United States now?", table: .dataModel))  {
                    return $0.updatingCorrectAnswers(officers.chiefJustice.names)
                }
                return $0
            }
    }
}

extension DataModel.QuestionDecoded {
    func updatingCorrectAnswers(_ newCorrectAnswers: [String]) -> Self {
        .init(uniqueId: uniqueId, category: category, type: type, question: question, correctAnswers: newCorrectAnswers, wrongAnswers: wrongAnswers, answerType: answerType, answerQuantity: answerQuantity, answerKey: answerKey)
    }
}


public extension UserDefaults {
    static let appLocaleKey = "AppLocale"
    
    @objc dynamic var appLocale: Locale {
        get {
            guard let locale = UserDefaults.standard.string(forKey: UserDefaults.appLocaleKey) else {
                return .current
            }
            return Locale(identifier: locale)
        }
        
        set {
            UserDefaults.standard.set(newValue.identifier, forKey: UserDefaults.appLocaleKey)
        }
    }
}
