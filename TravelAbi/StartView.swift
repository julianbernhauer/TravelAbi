//
//  StartView.swift
//  TravelAbi
//
//  Created by Julian Bernhauer on 22.05.23.
//

import SwiftUI

struct StartView: View {
    let date = Date.now
    var body: some View {
        TabView{
            HomeView()
                .badge(0)
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            FlightView()
                .badge(69)
                .tabItem{
                    Label("Flights", systemImage: "airplane")
                }
            thirdView()
                .badge(0)
                .tabItem{
                    Label("Weather", systemImage: "cloud.hail.fill")
                }
        }
        
    }
    
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
