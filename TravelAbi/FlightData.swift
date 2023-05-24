//
//  FlightData.swift
//  TravelAbi
//
//  Created by Julian Bernhauer on 22.05.23.
//

import Foundation

struct oldAssFlight: Hashable {
    var sIATA: String
    var sDepartureAirport: String
    var sArrivalAirport: String
    var sDepartureTime: String
    var sArrivaltime: String
    var delay: String
    static func preview() -> [oldAssFlight] {
        [oldAssFlight(sIATA: "EW2520", sDepartureAirport: "STR", sArrivalAirport: "BCN", sDepartureTime: "dep Time", sArrivaltime: "arrv Time", delay: "0")]
    }
}
