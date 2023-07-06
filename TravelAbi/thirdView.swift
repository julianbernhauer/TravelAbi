//
//  thirdView.swift
//  TravelAbi
//
//  Created by Julian Bernhauer on 23.05.23.
//

import SwiftUI


struct thirdView: View  {
    @State var name: String = ""
    @Environment(\.isEnabled) private var isEnabled
    
    var body: some View {
        
        NavigationView{
                VStack {
                    Text("kein wetter hier")
                    Image(systemName: "cloud.bolt.fill")

                    
                } .background(Color.white)
                .navigationTitle("Weather")
        }
    }
    


}

struct thirdView_Previews: PreviewProvider {
    static var previews: some View {
        thirdView()
    }
}

