//
//  AstronautHomeView.swift
//  GlobalAstronauts
//
//  Created by Manish Awasthi on 05.05.23.
//
import SwiftUI

struct AstronautHomeView: View {
    @EnvironmentObject var astronautRestData: AstronautsRestData

    var body: some View {
        
        NavigationView {
        
            List(astronautRestData.astronauts) { astronaut in
                        NavigationLink {
                            AstronautDetailView(astronaut: astronaut)
                        } label: {
                            AstronautRowView(astronaut: astronaut)
                        }
            }
            .navigationTitle("Astronauts")
            .listStyle(.grouped)
                }
        .onAppear {
            astronautRestData.getAstronauts()
        }
      
    }
}

struct AstronautHomeView_Previews: PreviewProvider {
    static var previews: some View {
        AstronautHomeView().environmentObject(AstronautsRestData())
    }
}
