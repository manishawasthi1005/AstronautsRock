//
//  AstronautHomeView.swift
//  GlobalAstronauts
//
//  Created by Manish Awasthi on 05.05.23.
//
import SwiftUI
import LocalAuthentication

struct AstronautHomeView: View {
    @EnvironmentObject var astronautRestData: AstronautsRestData
    @State private var unlocked = false

    var body: some View {
        NavigationView {
            if unlocked{
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
        }
        .onAppear {
            authenticate()
            astronautRestData.getAstronauts()
    }
    }
    func authenticate(){
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "This is for security reasons"){
                success, authenticationError in
                if success{
                    unlocked = true
                }else{
                    //There was a problem
                }
            }
            
        }else{
            //Phone does not have Biometrics
        }
    }
}

struct AstronautHomeView_Previews: PreviewProvider {
    static var previews: some View {
        AstronautHomeView().environmentObject(AstronautsRestData())
    }
}
