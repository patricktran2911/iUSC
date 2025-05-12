extension DataModel {
    
    public struct USStateOfficers: Modelable {
        public struct USOfficer: Modelable {
            public let names: [String]
            public let party: String?
        }
        
        public struct USStateOfficers: Modelable {
            public let name: String
            public let capital: String
            public let governor: String
            public let senators: [String]
        }
        
        public let president: USOfficer
        public let vicePresident: USOfficer
        public let chiefJustice: USOfficer
        public let speakerOfTheHouse: USOfficer
        public let stateOfficers: USStateOfficers
        
        public init(president: USOfficer, vicePresident: USOfficer, chiefJustice: USOfficer, speakerOfTheHouse: USOfficer, stateOfficers: USStateOfficers) {
            self.president = president
            self.vicePresident = vicePresident
            self.chiefJustice = chiefJustice
            self.speakerOfTheHouse = speakerOfTheHouse
            self.stateOfficers = stateOfficers
        }
    }
}
