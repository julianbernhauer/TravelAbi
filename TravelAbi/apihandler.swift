//
//  apihandler.swift
//  TravelAbi
//
//  Created by Julian Bernhauer on 22.05.23.
// airlabs.co v9

import Foundation
import UIKit

class apiHandling {
    var apiKey = ""
    var flightIATA = ""
    var departure = ""
    var arrival = ""
    var departureAirport = ""
    var arrivalAirport = ""
    var delayed: Int
    var flightsArray = ArrayHelper.init().flights
    
    init(apiKey: String = "", flightIATA: String = "", departure: String = "", arrival: String = "", departureAirport: String = "", arrivalAirport: String = "", delayed: Int, flightsArray: [Flight] = ArrayHelper.init().flights) {
        self.apiKey = apiKey
        self.flightIATA = flightIATA
        self.departure = departure
        self.arrival = arrival
        self.departureAirport = departureAirport
        self.arrivalAirport = arrivalAirport
        self.delayed = delayed
        self.flightsArray = flightsArray
    }
    
    
    
    func getFlightData(flightIATA: String){
        
        let prefixURL: String =  "https://airlabs.co/api/v9/flight?flight_iata="
        let postfixURL: String = "&api_key=84070674-82b7-4c95-950e-219f4d310f95"
        
        let combinedUrl: String = prefixURL + flightIATA + postfixURL
        print(combinedUrl)
        guard let url = URL(string: combinedUrl)else{return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("request error", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do{
                        //let welcome = try? JSONDecoder().decode(Welcome.self, from: data)
                        let flightData = try JSONDecoder().decode(Response.self, from: data)
                        print(flightData)
                        //
                        self.departureAirport = flightData.depCity ?? "depAirport NA"
                        self.departure = flightData.depTime ?? "depTime NA"
                        self.arrival = flightData.arrTime ?? "arrTime NA"
                        self.delayed = flightData.delayed ?? 0
                        
                        
                        
                      
                        let newFlight = Flight(sIATA: flightIATA, sDepartureAirport: self.departureAirport, sArrivalAirport: self.arrivalAirport, sDepartureTime: self.departure, sArrivaltime: self.arrival, delay: String(self.delayed))
                        self.flightsArray.append(newFlight)
                        print(newFlight)
                        
                        //flights.append()
                        
                    }catch let error {
                        print("Error decoding", error)
                    }
                    
                    
                    
                }
            }
        }
        dataTask.resume()
    }
    
    
    func readJSONFile() {
       do {
       
          // creating a path from the main bundle and getting data object from the path
          if let bundlePath = Bundle.main.path(forResource: "responseFl", ofType: "json"),
          let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                
             // Decoding the Product type from JSON data using JSONDecoder() class.
              let product = try JSONDecoder().decode(Response.self, from: jsonData)
              print(product)
              //print("Product name: \(product.depActual) and its price: \(product.airlineName)")
          }
       } catch {
          print(error)
       }
    }
}


