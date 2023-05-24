//
//  HomeView.swift
//  TravelAbi
//
//  Created by Julian Bernhauer on 22.05.23.
//

import SwiftUI

struct HomeView: View {
    @State var name: String = ""
    @Environment(\.isEnabled) private var isEnabled
    
    var body: some View {
        //TODO list, literally
        
        NavigationView{
                VStack {
                    
                    Text("huh").padding(20)
                    Image(systemName: "sun.max.fill")

                    
                } .background(Color.white)
                .navigationTitle("Welcome back")
        }
    }
    


}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

