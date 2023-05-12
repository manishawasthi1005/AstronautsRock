//
//  AstronautsRockApp.swift
//  AstronautsRock
//
//  Created by Manish Awasthi on 06.05.23.
//

import SwiftUI

@main
struct AstronautsRockApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
            WindowGroup {
                LockView().environmentObject(AstronautsRestData())
                    .environment(\.managedObjectContext, dataController.container.viewContext)
            }
        }
}
