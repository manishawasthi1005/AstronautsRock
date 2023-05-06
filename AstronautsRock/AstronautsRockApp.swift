//
//  AstronautsRockApp.swift
//  AstronautsRock
//
//  Created by Manish Awasthi on 06.05.23.
//

import SwiftUI

@main
struct AstronautsRockApp: App {
    var body: some Scene {
            WindowGroup {
                AstronautHomeView().environmentObject(AstronautsRestData())
            }
        }
}
