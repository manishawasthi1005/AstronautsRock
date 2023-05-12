//
//  AstronautsApiData.swift
//  AstronautsRock
//
//  Created by manish.m.awasthi on 12.05.23.
//

import Foundation
class AstronautsApiData: ObservableObject{
    /*@Published var astronauts:  [AstronautModel] = []
    //@Published var astronautFlights:  [Flight] = []
    static let shared = AstronautsApiData()
    
    func getAstronautsFromAPI(){
        let urlRequest = URLRequest(url: createURLComponents(path: "/2.2.0/astronaut").url!)
        URLSession.shared.dataTask(with: urlRequest){
            (data,response, error) in
            guard let apiHttpsResponse = response as? HTTPURLResponse else {
                return
            }
            
            guard let validData = data, error == nil else{
                if let error = error{
                    print("error: ", error)
                }
                return
            }
            if apiHttpsResponse.statusCode == 200{
                DispatchQueue.main.async {
                    do{
                        //let jsonResponse = try JSONSerialization.jsonObject(with: validData)
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .useDefaultKeys
                        self.astronauts = try decoder.decode(RestApiResponse.self, from: validData).results
                    }catch let serializationError{
                        print("serializationError: \(serializationError)")
                        return
                    }
                }
            }
            else if apiHttpsResponse.statusCode == 429{
                print("API response: \(apiHttpsResponse.description)")
                return
            }
        }.resume()
    }
    
    func getAstronaut(id: String){
        let urlRequest = URLRequest(url: createURLComponents(path: "/2.2.0/astronaut/\(id)").url!)
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            guard let apiHttpsRespose = response as? HTTPURLResponse else {
                return
            }
            guard let validData = data, error == nil else{
                if let error = error{
                    print("error: ", error)
                }
                return
            }
            if(apiHttpsRespose.statusCode == 200){
                DispatchQueue.main.async {
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .useDefaultKeys
                        let astronautFlightsResponse = try decoder.decode(Astronautflights.self, from: validData)
                        self.astronautFlights = astronautFlightsResponse.flights
                        
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
            else if apiHttpsRespose.statusCode == 429{
                print("API response: \(apiHttpsRespose.description)")
                return
            }
        }.resume()

    }
    func createURLComponents(path: String) -> URLComponents{
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "ll.thespacedevs.com"
        urlComponents.path = path
        return urlComponents
    }*/
}

