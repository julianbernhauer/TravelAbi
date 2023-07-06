//
//  TravelAbiApp.swift
//  TravelAbi
//
//  Created by Julian Bernhauer on 22.05.23.
//

import SwiftUI

@main
struct TravelAbiApp: App {
    @StateObject var dataController = DataController.shared
    var body: some Scene {
        WindowGroup {
            StartView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
