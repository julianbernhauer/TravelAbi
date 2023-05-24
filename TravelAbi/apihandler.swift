//
//  apihandler.swift
//  TravelAbi
//
//  Created by Julian Bernhauer on 22.05.23.
// airlabs.co v9

import Foundation
import UIKit

class apiHandling: ArrayHelper {
    var apiKey = ""
    var flightIATA = ""
    var departure = ""
    var arrival = ""
    var departureAirport = ""
    var arrivalAirport = ""
    var delayed: Int
    var newFlight: Flight?
    
    
    init(apiKey: String = "", flightIATA: String = "", departure: String = "", arrival: String = "", departureAirport: String = "", arrivalAirport: String = "", delayed: Int) {
        self.apiKey = apiKey
        self.flightIATA = flightIATA
        self.departure = departure
        self.arrival = arrival
        self.departureAirport = departureAirport
        self.arrivalAirport = arrivalAirport
        self.delayed = delayed
    }
    
    func getFlightData(flightIATA: String, completion: @escaping (Flight?) -> Void) {
        let prefixURL = "https://airlabs.co/api/v9/flight?flight_iata="
        let postfixURL = "&api_key=84070674-82b7-4c95-950e-219f4d310f95"
        let combinedUrl = prefixURL + flightIATA + postfixURL
        
        guard let url = URL(string: combinedUrl) else {
            completion(nil)
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error:", error)
                completion(nil)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(nil)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let flightData = try JSONDecoder().decode(AirLabsResponse.self, from: data)

                guard let request = flightData.response else {
                    print("Invalid JSON structure - 'response' key not found.")
                    completion(nil)
                    return
                }
                
                self.departureAirport = request.dep_city ?? "depAirport NA"
                self.arrivalAirport = request.arr_city ?? "arrAirport NA"
                self.departure = request.dep_time ?? "depTime NA"
                self.arrival = request.arr_time ?? "arrTime NA"
                self.delayed = request.delayed ?? 0
                print(self.formatDate(givenDateTime: self.departure))
                
                
                let newFlight = Flight(sIATA: flightIATA, sDepartureAirport: self.departureAirport, sArrivalAirport: self.arrivalAirport, sDepartureTime: self.formatDate(givenDateTime: self.departure), sArrivaltime: self.formatDate(givenDateTime: self.arrival), delay: String(self.delayed))
                self.addFlight(flight: newFlight)
                
                completion(newFlight)
            } catch let error {
                print("Error decoding:", error)
                completion(nil)
            }
        }
        
        dataTask.resume()
    }

    
    
    
    
    func readJSONFile() -> Flight? {
        do {
            if let bundlePath = Bundle.main.path(forResource: "responseFl", ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                
                let decoder = JSONDecoder()
                let deData = try decoder.decode(AirLabsResponse.self, from: jsonData)
                
                guard let request = deData.response else {
                    print("Invalid JSON structure - 'response' key not found.")
                    return nil
                }
                
                self.departureAirport = request.dep_city ?? "depAirport NA"
                self.arrivalAirport = request.arr_city ?? "arrAirport Na"
                self.departure = request.dep_time ?? "depTime NA"
                self.arrival = request.arr_time ?? "arrTime NA"
                self.delayed = request.delayed ?? 0
                
                
                let arrivalTime = self.formatDate(givenDateTime: self.arrival)
                print(arrivalTime)
                
                let newFlight = Flight(sIATA: flightIATA, sDepartureAirport: self.departureAirport, sArrivalAirport: self.arrivalAirport, sDepartureTime: self.formatDate(givenDateTime: self.departure), sArrivaltime: arrivalTime, delay: String(self.delayed))
                self.addFlight(flight: newFlight)
                print(flights)
                
                return newFlight
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
}


