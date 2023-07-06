//
//  FlightData.swift
//  TravelAbi
//
//  Created by Julian Bernhauer on 22.05.23.
//

import Foundation

struct FlightModel: Hashable {
    var sIATA: String
    var sDepartureAirport: String
    var sArrivalAirport: String
    var sDepartureTime: String
    var sArrivaltime: String
    var delay: String
    var sDepGate: String
    static func preview() -> [FlightModel] {
        [FlightModel(sIATA: "EW2520", sDepartureAirport: "STR", sArrivalAirport: "BCN", sDepartureTime: "dep Time", sArrivaltime: "arrv Time", delay: "0", sDepGate: "0")]
    }
}
