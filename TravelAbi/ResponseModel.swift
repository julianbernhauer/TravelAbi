// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let request: Request?
    let response: Response?
    let terms: String?

    enum CodingKeys: String, CodingKey {
        case request = "request"
        case response = "response"
        case terms = "terms"
    }
}

// MARK: - Request
struct Request: Codable {
    let lang: String?
    let currency: String?
    let time: Int?
    let id: String?
    let server: String?
    let host: String?
    let pid: Int?
    let key: Key?
    let params: Params?
    let version: Int?
    let method: String?
    let client: Client?

    enum CodingKeys: String, CodingKey {
        case lang = "lang"
        case currency = "currency"
        case time = "time"
        case id = "id"
        case server = "server"
        case host = "host"
        case pid = "pid"
        case key = "key"
        case params = "params"
        case version = "version"
        case method = "method"
        case client = "client"
    }
}

// MARK: - Client
struct Client: Codable {
    let ip: String?
    let geo: Geo?
    let connection: Connection?
    let device: Agent?
    let agent: Agent?
    let karma: Karma?

    enum CodingKeys: String, CodingKey {
        case ip = "ip"
        case geo = "geo"
        case connection = "connection"
        case device = "device"
        case agent = "agent"
        case karma = "karma"
    }
}

// MARK: - Agent
struct Agent: Codable {
}

// MARK: - Connection
struct Connection: Codable {
    let type: String?

    enum CodingKeys: String, CodingKey {
        case type = "type"
    }
}

// MARK: - Geo
struct Geo: Codable {
    let countryCode: String?
    let country: String?
    let continent: String?
    let lat: Double?
    let lng: Double?

    enum CodingKeys: String, CodingKey {
        case countryCode = "country_code"
        case country = "country"
        case continent = "continent"
        case lat = "lat"
        case lng = "lng"
    }
}

// MARK: - Karma
struct Karma: Codable {
    let isBlocked: Bool?
    let isCrawler: Bool?
    let isBot: Bool?
    let isFriend: Bool?
    let isRegular: Bool?

    enum CodingKeys: String, CodingKey {
        case isBlocked = "is_blocked"
        case isCrawler = "is_crawler"
        case isBot = "is_bot"
        case isFriend = "is_friend"
        case isRegular = "is_regular"
    }
}

// MARK: - Key
struct Key: Codable {
    let id: Int?
    let apiKey: String?
    let type: String?
    let expired: String?
    let registered: String?
    let limitsByHour: Int?
    let limitsByMinute: Int?
    let limitsByMonth: Int?
    let limitsTotal: Int?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case apiKey = "api_key"
        case type = "type"
        case expired = "expired"
        case registered = "registered"
        case limitsByHour = "limits_by_hour"
        case limitsByMinute = "limits_by_minute"
        case limitsByMonth = "limits_by_month"
        case limitsTotal = "limits_total"
    }
}

// MARK: - Params
struct Params: Codable {
    let flightIata: String?
    let lang: String?

    enum CodingKeys: String, CodingKey {
        case flightIata = "flight_iata"
        case lang = "lang"
    }
}

// MARK: - Response
struct Response: Codable {
    let aircraftIcao: String?
    let airlineIata: String?
    let airlineIcao: String?
    let flightIata: String?
    let flightIcao: String?
    let flightNumber: String?
    let depIata: String?
    let depIcao: String?
    let depTerminal: String?
    let depGate: String?
    let depTime: String?
    let depEstimated: String?
    let depActual: String?
    let depTimeUTC: String?
    let depEstimatedUTC: String?
    let depActualUTC: String?
    let depTimeTs: Int?
    let depEstimatedTs: Int?
    let depActualTs: Int?
    let arrIata: String?
    let arrIcao: String?
    let arrTerminal: String?
    let arrGate: JSONNull?
    let arrBaggage: String?
    let arrTime: String?
    let arrEstimated: String?
    let arrActual: String?
    let arrTimeUTC: String?
    let arrEstimatedUTC: String?
    let arrActualUTC: String?
    let arrTimeTs: Int?
    let arrEstimatedTs: Int?
    let arrActualTs: Int?
    let csAirlineIata: JSONNull?
    let csFlightNumber: JSONNull?
    let csFlightIata: JSONNull?
    let regNumber: JSONNull?
    let status: String?
    let duration: Int?
    let delayed: Int?
    let depDelayed: Int?
    let arrDelayed: Int?
    let updated: Int?
    let depName: String?
    let depCity: String?
    let depCountry: String?
    let arrName: String?
    let arrCity: String?
    let arrCountry: String?
    let airlineName: String?
    let flag: String?
    let percent: Int?
    let utc: String?

    enum CodingKeys: String, CodingKey {
        case aircraftIcao = "aircraft_icao"
        case airlineIata = "airline_iata"
        case airlineIcao = "airline_icao"
        case flightIata = "flight_iata"
        case flightIcao = "flight_icao"
        case flightNumber = "flight_number"
        case depIata = "dep_iata"
        case depIcao = "dep_icao"
        case depTerminal = "dep_terminal"
        case depGate = "dep_gate"
        case depTime = "dep_time"
        case depEstimated = "dep_estimated"
        case depActual = "dep_actual"
        case depTimeUTC = "dep_time_utc"
        case depEstimatedUTC = "dep_estimated_utc"
        case depActualUTC = "dep_actual_utc"
        case depTimeTs = "dep_time_ts"
        case depEstimatedTs = "dep_estimated_ts"
        case depActualTs = "dep_actual_ts"
        case arrIata = "arr_iata"
        case arrIcao = "arr_icao"
        case arrTerminal = "arr_terminal"
        case arrGate = "arr_gate"
        case arrBaggage = "arr_baggage"
        case arrTime = "arr_time"
        case arrEstimated = "arr_estimated"
        case arrActual = "arr_actual"
        case arrTimeUTC = "arr_time_utc"
        case arrEstimatedUTC = "arr_estimated_utc"
        case arrActualUTC = "arr_actual_utc"
        case arrTimeTs = "arr_time_ts"
        case arrEstimatedTs = "arr_estimated_ts"
        case arrActualTs = "arr_actual_ts"
        case csAirlineIata = "cs_airline_iata"
        case csFlightNumber = "cs_flight_number"
        case csFlightIata = "cs_flight_iata"
        case regNumber = "reg_number"
        case status = "status"
        case duration = "duration"
        case delayed = "delayed"
        case depDelayed = "dep_delayed"
        case arrDelayed = "arr_delayed"
        case updated = "updated"
        case depName = "dep_name"
        case depCity = "dep_city"
        case depCountry = "dep_country"
        case arrName = "arr_name"
        case arrCity = "arr_city"
        case arrCountry = "arr_country"
        case airlineName = "airline_name"
        case flag = "flag"
        case percent = "percent"
        case utc = "utc"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
