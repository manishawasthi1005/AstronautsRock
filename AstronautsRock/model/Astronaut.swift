//
//  Astronaut.swift
//  Astronauts
//
//  Created by Manish Awasthi on 03.05.23.
//

import Foundation

struct ApiResponse: Decodable {
    var results: [Astronaut]
}

struct Astronaut: Decodable, Identifiable{
    var id: Int = 0
    var url: String = ""
    var name: String = ""
    var age: Int = 0
    var profile_image: String = ""
    var profile_image_thumbnail: String = ""
    //var dateOfBirth: Date
    var agency: Agency
    
}

struct Agency: Decodable {
    var name: String
    var url: String
}

struct Astronautflights: Decodable{
    var flights: [Flight]
}

struct LaunchServiceProvider: Decodable{
    let id: Int
    let url: String
    let name: String
    let type: String
}

struct Flight: Decodable, Identifiable{
    let id: String
    let url: String
    var name: String
    var launch_service_provider: LaunchServiceProvider
}

extension Astronaut {
    static let astronauts = [sampleAstronautData, sampleAstronautData,sampleAstronautData]
    
    static let flights = [Flight(id: "301250", url: "https://SampleFlightURL", name: "test-Lufthansa",
                                 launch_service_provider: LaunchServiceProvider(id: 400001, url: "https://SampleLaunchSPURL", name: "Test-Lufthansa-LSP1", type: "Commercial")),
                          Flight(id: "301251", url: "https://SampleFlightURL2", name: "test-Lufthansa2",
                                 launch_service_provider: LaunchServiceProvider(id: 400002, url: "https://SampleLaunchSPURL2", name: "Test-Lufthansa-LSP2", type: "Commercial")),
                          Flight(id: "301253", url: "https://SampleFlightURL", name: "test-Lufthansa3",
                                 launch_service_provider: LaunchServiceProvider(id: 400003, url: "https://SampleLaunchSPURL3", name: "Test-Lufthansa-LSP3", type: "Commercial"))]
    
    static let sampleAstronautData = Astronaut(
        id: 1,
        url: "https://ll.thespacedevs.com/2.2.0/astronaut/1/",
        name: "Thomas Pesquet",
        age: 30,
        profile_image: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/astronaut_images/thomas2520pesquet_image_20200102120546.jpeg",
        agency: Agency(name: "European Space Agency", url: "https://ll.thespacedevs.com/2.2.0/agencies/27/"))
    
}
