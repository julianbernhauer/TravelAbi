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
}

struct Key: Codable {
    let id: Int?
    let api_key: String?
    let type: String?
    let expired: String?
    let registered: String?
    let limits_by_hour: Int?
    let limits_by_minute: Int?
    let limits_by_month: Int?
    let limits_total: Int?
}

struct Params: Codable {
    let flight_iata: String?
    let lang: String?
}

struct Client: Codable {
    let ip: String?
    let geo: Geo?
    let connection: Connection?
    let device: [String: String]?
    let agent: [String: String]?
    let karma: Karma?
}

struct Geo: Codable {
    let country_code: String?
    let country: String?
    let continent: String?
    let lat: Double?
    let lng: Double?
}

struct Connection: Codable {
    let type: String?
}

struct Karma: Codable {
    let is_blocked: Bool?
    let is_crawler: Bool?
    let is_bot: Bool?
    let is_friend: Bool?
    let is_regular: Bool?
}

struct Response: Codable, Hashable {
    let aircraft_icao: String?
    let airline_iata: String?
    let airline_icao: String?
    let flight_iata: String?
    let flight_icao: String?
    let flight_number: String?
    let dep_iata: String?
    let dep_icao: String?
    let dep_terminal: String?
    let dep_gate: String?
    let dep_time: String?
    let dep_estimated: String?
    let dep_actual: String?
    let dep_time_utc: String?
    let dep_estimated_utc: String?
    let dep_actual_utc: String?
    let dep_time_ts: Int?
    let arr_iata: String?
    let arr_icao: String?
    let arr_terminal: String?
    let arr_gate: String?
    let arr_baggage: String?
    let arr_time: String?
    let arr_estimated: String?
    let arr_actual: String?
    let arr_time_utc: String?
    let arr_estimated_utc: String?
    let arr_actual_utc: String?
    let arr_time_ts: Int?
    let arr_estimated_ts: Int?
    let cs_airline_iata: String?
    let cs_flight_number: String?
    let cs_flight_iata: String?
    let reg_number: String?
    let status: String?
    let duration: Int?
    let delayed: Int?
    let dep_delayed: Int?
    let arr_delayed: Int?
    let updated: Int?
    let dep_name: String?
    let dep_city: String?
    let dep_country: String?
    let arr_name: String?
    let arr_city: String?
    let arr_country: String?
    let airline_name: String?
    let flag: String?
    let percent: Int?
    let utc: String?
}

struct AirLabsResponse: Codable {
    let request: Request?
    let response: Response?
    let terms: String?
}
