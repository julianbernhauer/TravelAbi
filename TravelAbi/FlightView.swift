//
//  FlightView.swift
//  TravelAbi
//
//  Created by Julian Bernhauer on 22.05.23.
//

import SwiftUI
import Combine

struct FlightView: View {
    @State var flightIATA: String = ""
    @State var flightCode: String = ""
    @State var listID = 1
    @ObservedObject var arrayHelper = ArrayHelper()
    var body: some View {
        NavigationStack{
            List{
                Section{
                    TextField("Enter flight number", text: $flightCode)
                }
                Section{
                    ForEach(arrayHelper.flights, id: \.sDepartureTime) { flight in
                        HStack {
                            Image(systemName: "airplane.departure")
                            VStack(alignment: .center){

                                Text("departure: " + flight.sDepartureAirport + " " + flight.sDepartureTime)
                                Text("arrival: " + flight.sArrivalAirport + " " + flight.sArrivaltime)
                            }
                            Text("delay: " + flight.delay)
                        }
                    }
                }
            }
                .id(listID)
            
                .navigationTitle("Flights")
                .onSubmit {
                    Task{
                        await getFlightData()
                    }
                }
        }
    }
    
    
    
    
    
    
    
    func getFlightData() async{
        
        //
        
         let apiHandler = apiHandling(flightIATA: flightCode, delayed: 0)
         apiHandler.getFlightData(flightIATA: flightCode) { flight in
         if let flight = flight {
         // Flight data retrieved successfully
         // Access the flight object and perform desired operations
         arrayHelper.addFlight(flight: flight)
         } else {
         // Error occurred or no flight data available
         // Handle the error or absence of data
         print("Failed to retrieve flight data.")
         }
         }
         
        //
        
        
        
        /*
        
        //JSON
        let dataCall = apiHandling(flightIATA: flightCode, delayed: 0)
        //dataCall.getFlightData(flightIATA: answer)
        let test = dataCall.readJSONFile()
        arrayHelper.addFlight(flight: (test)!)
        */
    }
}
struct FlightView_Previews: PreviewProvider {
    static var previews: some View {
        FlightView()
    }
}
