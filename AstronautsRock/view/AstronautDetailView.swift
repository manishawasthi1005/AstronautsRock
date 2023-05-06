//
//  AstronautDetailView.swift
//  GlobalAstronauts
//
//  Created by Manish Awasthi on 05.05.23.
//
import SwiftUI

struct AstronautDetailView: View {
    @EnvironmentObject var astronautRestData: AstronautsRestData

    let astronaut : Astronaut
    
    var body: some View {
        ScrollView() {
            
            AsyncImage(url: URL(string: astronaut.profile_image)){ image in
                image.resizable().scaledToFit().shadow(radius: 10)
            } placeholder: {
                ProgressView()
            }.frame(height: 400)
            VStack(alignment: .leading){
                HStack {
                    Label("Flights", systemImage: "airplane.circle.fill").font(.largeTitle)
                    Spacer()
                }
                ForEach(astronautRestData.astronautFlights){
                    flight in
                    VStack(alignment: .leading) {
                        Text(flight.name ).font(.title).foregroundColor(Color.purple).padding()
                        Spacer()
                    }
                    
                }
                Spacer()
            }
            
            
            //AstronautInfoText(astronaut: astronaut)
            Spacer()
        }
        .navigationTitle(astronaut.name)
            .navigationBarTitleDisplayMode(.inline)
            .onAppear{
                astronautRestData.getAstronaut(id:String(astronaut.id))
        }
        
    }
}

struct AstronautDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AstronautDetailView(astronaut: Astronaut.sampleAstronautData).environmentObject(AstronautsRestData())
    }
}
