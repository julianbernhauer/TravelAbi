//
//  HelperClass.swift
//  TravelAbi
//
//  Created by Julian Bernhauer on 22.05.23.
//

import Foundation
class ArrayHelper: ObservableObject {
    @Published var flights: [Flight] = [Flight(sIATA: "EW2520", sDepartureAirport: "STR", sArrivalAirport: "BCN", sDepartureTime: "now", sArrivaltime: "later", delay: "none")]
    @Published var flights2 = Flight.preview()
    
    func addFlight(flight: Flight){
        flights.append(flight)
    }
    func getAllFlights() -> [Flight]{
        return flights
    }

    
}
