//
//  HelperClass.swift
//  TravelAbi
//
//  Created by Julian Bernhauer on 22.05.23.
//

import Foundation
class ArrayHelper: ObservableObject {
    @Published var flights: [Flight] = [Flight(sIATA: "AITA", sDepartureAirport: "FRA", sArrivalAirport: "LAX", sDepartureTime: "02:22", sArrivaltime: "12:00", delay: "none")]
    @Published var flights2 = Flight.preview()

    
    func addFlight(flight: Flight){
        flights.append(flight)
    }
    func getAllFlights() -> [Flight]{
        return flights
    }
    
    func formatDate(givenDateTime: String) -> String{
        print("kjahjklsfbjklwbjklf")
        let dateString = givenDateTime
        let formattedTime: String = ""

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"

        if let date = dateFormatter.date(from: dateString) {
                let timeFormatter = DateFormatter()
                timeFormatter.dateFormat = "HH:mm"
                let formattedTime = timeFormatter.string(from: date)
                return formattedTime
        } else {
            print("Invalid date string")
        }
        return(formattedTime)
    }

    
}
