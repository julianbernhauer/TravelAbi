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
                    AdaptiveImage(light: Image(systemName: "sun.max.fill"), dark: Image(systemName: "moon"))

                    
                } .background(Color.white)
                .navigationTitle("Welcome back")
        }
    }
    


}
struct AdaptiveImage: View {
    @Environment(\.colorScheme) var colorScheme
    let light: Image
    let dark: Image

    @ViewBuilder var body: some View {
        if colorScheme == .light {
            light
        } else {
            dark
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

