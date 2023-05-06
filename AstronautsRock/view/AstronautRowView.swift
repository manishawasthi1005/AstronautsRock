//
//  AstronautRowView.swift
//  GlobalAstronauts
//
//  Created by Manish Awasthi on 05.05.23.
//

import SwiftUI

struct AstronautRowView: View {
    let astronaut : Astronaut
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: astronaut.profile_image)){ image in
                image.resizable().scaledToFit().clipShape(Circle()).shadow(radius: 10)
            } placeholder: {
                ProgressView()
            }.frame(height: 100).padding()
            
            VStack(alignment: .leading, spacing: 5) {
                Text(astronaut.name)
                    .font(.system(size: 25))
                    .fontWeight(.medium)
                
                Text("Age: \(String(astronaut.age)) years")
                    .font(.system(size: 25))
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
        }
    }
}

struct AstronautRowView_Previews: PreviewProvider {
    static var previews: some View {
        AstronautRowView(astronaut: Astronaut.sampleAstronautData).environmentObject(AstronautsRestData())
    }
}
