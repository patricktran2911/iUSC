extension DataState {
    public enum USState: String, Modelable, CaseIterable {
        case AL = "area_AL", AK = "area_AK", AZ = "area_AZ", AR = "area_AR", CA = "area_CA"
        case CO = "area_CO", CT = "area_CT", DE = "area_DE", FL = "area_FL", GA = "area_GA"
        case HI = "area_HI", ID = "area_ID", IL = "area_IL", IN = "area_IN", IA = "area_IA"
        case KS = "area_KS", KY = "area_KY", LA = "area_LA", ME = "area_ME", MD = "area_MD"
        case MA = "area_MA", MI = "area_MI", MN = "area_MN", MS = "area_MS", MO = "area_MO"
        case MT = "area_MT", NE = "area_NE", NV = "area_NV", NH = "area_NH", NJ = "area_NJ"
        case NM = "area_NM", NY = "area_NY", NC = "area_NC", ND = "area_ND", OH = "area_OH"
        case OK = "area_OK", OR = "area_OR", PA = "area_PA", RI = "area_RI", SC = "area_SC"
        case SD = "area_SD", TN = "area_TN", TX = "area_TX", UT = "area_UT", VT = "area_VT"
        case VA = "area_VA", WA = "area_WA", WV = "area_WV", WI = "area_WI", WY = "area_WY"

        public var abbreviation: String {
            String(rawValue.dropFirst(5))
        }

        public var fullStateName: String {
            switch self {
            case .AL: return "Alabama"
            case .AK: return "Alaska"
            case .AZ: return "Arizona"
            case .AR: return "Arkansas"
            case .CA: return "California"
            case .CO: return "Colorado"
            case .CT: return "Connecticut"
            case .DE: return "Delaware"
            case .FL: return "Florida"
            case .GA: return "Georgia"
            case .HI: return "Hawaii"
            case .ID: return "Idaho"
            case .IL: return "Illinois"
            case .IN: return "Indiana"
            case .IA: return "Iowa"
            case .KS: return "Kansas"
            case .KY: return "Kentucky"
            case .LA: return "Louisiana"
            case .ME: return "Maine"
            case .MD: return "Maryland"
            case .MA: return "Massachusetts"
            case .MI: return "Michigan"
            case .MN: return "Minnesota"
            case .MS: return "Mississippi"
            case .MO: return "Missouri"
            case .MT: return "Montana"
            case .NE: return "Nebraska"
            case .NV: return "Nevada"
            case .NH: return "New Hampshire"
            case .NJ: return "New Jersey"
            case .NM: return "New Mexico"
            case .NY: return "New York"
            case .NC: return "North Carolina"
            case .ND: return "North Dakota"
            case .OH: return "Ohio"
            case .OK: return "Oklahoma"
            case .OR: return "Oregon"
            case .PA: return "Pennsylvania"
            case .RI: return "Rhode Island"
            case .SC: return "South Carolina"
            case .SD: return "South Dakota"
            case .TN: return "Tennessee"
            case .TX: return "Texas"
            case .UT: return "Utah"
            case .VT: return "Vermont"
            case .VA: return "Virginia"
            case .WA: return "Washington"
            case .WV: return "West Virginia"
            case .WI: return "Wisconsin"
            case .WY: return "Wyoming"
            }
        }
    }

}
