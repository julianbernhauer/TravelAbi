//
//  FlightView.swift
//  TravelAbi
//
//  Created by Julian Bernhauer on 22.05.23.
//

import SwiftUI
import Combine
import CoreData

struct FlightView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var fetchFlights: FetchedResults<Flights>
    
    
    @State var flightIATA: String = ""
    @State var flightCode: String = ""
    @ObservedObject var arrayHelper = ArrayHelper()
    var body: some View {
        NavigationStack{
            List{
                Section{
                    TextField("Enter flight number", text: $flightCode)
                }
                Section{
                    ForEach(fetchFlights) { FFlights in
                        HStack {
                            Image(systemName: "airplane.departure")
                            VStack(alignment: .center){
                                Text("departure: " + (FFlights.dep_Airport ?? "depAiport NA")) + Text(" ") + Text(FFlights.dep_Time ?? "depTime NA")
                                
                                Text("arrival: " + (FFlights.arr_Airport ?? "arrAirport NA")) + Text(" ") + Text(FFlights.arr_Time ?? "arrTime NA")
                            }
                            Text("delay: ")
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button(action: {
                                deleteFlight(at: fetchFlights.firstIndex(of: FFlights)!)
                            }) {
                                Label("Delete", systemImage: "trash")
                            }
                            .tint(.red)
                        }
                    }
                }
                
                
            }
            .navigationTitle("Flights")
            .onSubmit {
                Task{
                    await testP()
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
    
    
    func testP(){
        
        let dataCall = apiHandling(flightIATA: flightCode, delayed: 0)
        //dataCall.getFlightData(flightIATA: answer)
        let test = dataCall.readJSONFile()
        //arrayHelper.addFlight(flight: (test)!)
        
        let flight = Flights(context: moc)
        flight.arr_Airport = test?.sArrivalAirport
        flight.arr_Time = test?.sArrivaltime
        flight.dep_Airport = test?.sDepartureAirport
        flight.dep_Time = test?.sDepartureTime
        flight.delay = test?.delay
        
        try? moc.save()
        
        
    }
    
    func deleteFlight(at index: Int) {
        if let flight = fetchFlights[safe: index] {
            moc.delete(flight)
            try? moc.save()
        }
    }
}
struct FlightView_Previews: PreviewProvider {
    static var previews: some View {
        FlightView()
    }
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}

