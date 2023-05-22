//
//  HomeView.swift
//  TravelAbi
//
//  Created by Julian Bernhauer on 22.05.23.
//

import SwiftUI

struct HomeView: View {
    @State var name: String = ""
    @State var flightIATA: String = ""
    @Environment(\.isEnabled) private var isEnabled
    var body: some View {
        
        NavigationView{
                VStack {
                    Text("Input flight number")
                    TextField("Flight Number", text: $flightIATA)
                        .padding()
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                        .foregroundColor(.white)
                    
                    Button {
                        Task{
                            await getFlightData
                        }
                    } label: {
                        Text("get flight data")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 220, height: 60)
                            .background(isEnabled ? .gray : .indigo)
                            .cornerRadius(15.0)
                            
                    }
                    .disabled(flightIATA.isEmpty )
                    .contentShape(Rectangle())
                    
                } .background(Color.white)
                .navigationTitle("add flight")
        }
    }
    
    //functionality
    func getFlightData() async{
        let dataCall = apiHandling(flightIATA: flightIATA,delayed: 0)
        dataCall.getFlightData(flightIATA: flightIATA)
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

