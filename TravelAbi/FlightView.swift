//
//  FlightView.swift
//  TravelAbi
//
//  Created by Julian Bernhauer on 22.05.23.
//

import SwiftUI

struct FlightView: View {
    @State var flightIATA: String = ""
    @State var flightCode: String = ""
    var flights = ArrayHelper.init().flights
    var body: some View {
        NavigationStack{
            List{
                Section{
                    TextField("Enter flight number", text: $flightCode)
                }
                Section{
                    ForEach(flights, id: \.sDepartureTime) { flights in
                        HStack{
                            Text(flights.sDepartureAirport)
                            Text(flights.sDepartureTime)
                            Text(flights.sArrivalAirport)
                            Text(flights.sArrivaltime)
                            Text("delay:")
                            Text(flights.delay)
                            
                        }
                    }
                }
            }

                .toolbar{
                    ToolbarItem(placement: .confirmationAction){
            
                        
                        Button{
                            Task{
                                
                                
                            }
                        }label: {
                            Label("Add", systemImage: "plus")
                        }
                        
                    }
                }
            }.navigationTitle("Flights")
            .onSubmit {
                Task{
                    await getFlightData()
                }
            }
        }


        
    
    //functionality
    func getFlightData() async{
        print("nutten")
        let answer = flightCode
        let dataCall = apiHandling(flightIATA: answer, delayed: 0)
        //dataCall.getFlightData(flightIATA: answer)
        dataCall.readJSONFile()
        
    }
    

}

struct FlightView_Previews: PreviewProvider {
    static var previews: some View {
        FlightView()
    }
}
