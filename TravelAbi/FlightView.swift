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
                            VStack(alignment: .leading){
                                Text("departure: " + (FFlights.dep_Airport ?? "depAiport NA")) + Text(" ") + Text(FFlights.dep_Time ?? "depTime NA")
                                
                                Text("arrival: " + (FFlights.arr_Airport ?? "arrAirport NA")) + Text(" ") + Text(FFlights.arr_Time ?? "arrTime NA")
                            }
                            VStack{
                                Text("delay: ") + Text(FFlights.delay ?? "delay NA")
                                Text("dep gate: ") + Text(FFlights.dep_Gate ?? "")
                            }

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
            .refreshable {
                updateAllFlightsWithData()
                
            }
            .navigationTitle("Flights")
            .onSubmit {
                Task{
                    await getFlightData(flightAita: flightCode)
                }
            }
        }
    }
    
    
    

    
    func getFlightData(flightAita: String) async{
        
        //
        let flight = Flights(context: moc)
        let apiHandler = apiHandling(flightIATA: flightCode, delayed: 0, depGate: "")
        apiHandler.getFlightData(flightIATA: flightCode) { plight in
            if let plight = plight {
                // Flight data retrieved successfully
                // Access the flight object and perform desired operations
                arrayHelper.addFlight(flight: plight)
                
                flight.arr_Airport = plight.sArrivalAirport
                flight.arr_Time = plight.sArrivaltime
                flight.dep_Airport = plight.sDepartureAirport
                flight.dep_Time = plight.sDepartureTime
                flight.delay = plight.delay
                flight.dep_Gate = plight.sDepGate
                try? moc.save()
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
    
    

    
    
    func testP(flightAITA: String){
        
        let dataCall = apiHandling(flightIATA: flightCode, delayed: 0, depGate: "")
        //dataCall.getFlightData(flightIATA: answer)
        let test = dataCall.readJSONFile()
        //arrayHelper.addFlight(flight: (test)!)
        
        let flight = Flights(context: moc)
        flight.arr_Airport = test?.sArrivalAirport
        flight.arr_Time = test?.sArrivaltime
        flight.dep_Airport = test?.sDepartureAirport
        flight.dep_Time = test?.sDepartureTime
        flight.delay = test?.delay
        flight.flight_iata = test?.sIATA
        
        
        try? moc.save()
        
        
    }
    
    func deleteFlight(at index: Int) {
        if let flight = fetchFlights[safe: index] {
            moc.delete(flight)
            try? moc.save()
        }
    }
    
    func fetchAllFlights() -> [(index: Int, flight: Flights)] {
        let fetchRequest: NSFetchRequest<Flights> = Flights.fetchRequest()
        
        do {
            let fetchedFlights = try moc.fetch(fetchRequest)
            let flightsWithIndices = fetchedFlights.enumerated().map { (index, flight) in
                return (index: index, flight: flight)
            }
            return flightsWithIndices
        } catch {
            // Handle the error gracefully
            print("Failed to fetch flights: \(error)")
            return []
        }
    }

    func updateAllFlightsWithData() {
        let dataCall = apiHandling(flightIATA: flightCode, delayed: 0, depGate: "")
        let apiHandler = apiHandling(flightIATA: flightCode, delayed: 0, depGate: "")
        let fetchRequest: NSFetchRequest<Flights> = Flights.fetchRequest()
        
        do {
            let flights = try moc.fetch(fetchRequest)
            
            for (index, flight) in flights.enumerated() {
                
               // flight.flight_iata da statt readJson normale func dann updaten mit aita
                //
                

                apiHandler.getFlightData(flightIATA: flightCode) { plight in
                    if let plight = plight {
                        // Flight data retrieved successfully
                        // Access the flight object and perform desired operations
                        arrayHelper.addFlight(flight: plight)
                        
                        flight.arr_Airport = plight.sArrivalAirport
                        flight.arr_Time = plight.sArrivaltime
                        flight.dep_Airport = plight.sDepartureAirport
                        flight.dep_Time = plight.sDepartureTime
                        flight.delay = plight.delay
                        flight.dep_Gate = plight.sDepGate
                        try? moc.save()
                    } else {
                        // Error occurred or no flight data available
                        // Handle the error or absence of data
                        print("Failed to retrieve flight data.")
                    }
                }
                
                
                
                
                
                
                
                
                /*
                //
                let test = dataCall.readJSONFile()
                
                
                flight.dep_Airport = test?.sDepartureAirport
                flight.arr_Airport = test?.sArrivalAirport
                flight.arr_Time = test?.sArrivaltime
                flight.dep_Time = test?.sDepartureTime
                flight.delay = test?.delay
                // Update other flight properties based on new data
                
                // Save the changes
                try? moc.save()
                */
            }
        } catch {
            print("Error fetching flights: \(error)")
        }
    }

    
    
    
    func updateFlight(){
        let dataCall = apiHandling(flightIATA: flightCode, delayed: 0, depGate: "")
        let test = dataCall.readJSONFile()
        let flight = Flights(context: moc)
        flight.flight_iata = test?.sIATA
        
        
        let flightList = fetchAllFlights()
        
        for (index,flight) in flightList {
            //
            let test = dataCall.readJSONFile()
            //arrayHelper.addFlight(flight: (test)!)
            
            let dcFlight = Flights(context: moc)
            dcFlight.arr_Airport = test?.sArrivalAirport
            dcFlight.arr_Time = test?.sArrivaltime
            dcFlight.dep_Airport = test?.sDepartureAirport
            dcFlight.dep_Time = test?.sDepartureTime
            dcFlight.delay = test?.delay
            dcFlight.flight_iata = test?.sIATA
            
            try? moc.save()
            //
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



/*
 THIS WORKS
 func updateAllFlightsWithData() {
     let dataCall = apiHandling(flightIATA: flightCode, delayed: 0, depGate: "")
    // let test = dataCall.readJSONFile()
     
     
     let fetchRequest: NSFetchRequest<Flights> = Flights.fetchRequest()
     
     do {
         let flights = try moc.fetch(fetchRequest)
         
         for (index, flight) in flights.enumerated() {
             
            // flight.flight_iata da statt readJson normale func dann updaten mit aita
             let test = dataCall.readJSONFile()
             
             
             flight.dep_Airport = test?.sDepartureAirport
             flight.arr_Airport = test?.sArrivalAirport
             flight.arr_Time = test?.sArrivaltime
             flight.dep_Time = test?.sDepartureTime
             flight.delay = test?.delay
             // Update other flight properties based on new data
             
             // Save the changes
             try? moc.save()
         }
     } catch {
         print("Error fetching flights: \(error)")
     }
 }
 */
