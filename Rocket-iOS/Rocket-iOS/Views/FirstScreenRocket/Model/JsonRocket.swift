//
//  JsonRocket.swift
//  Rocket-iOS
//
//  Created by Sergey Bodnar on 09.04.2022.
//

import Foundation

struct JsonRocket: Decodable {
    var flickr_images: [String?]
    
    var name: String?
    
    var height: HeightRocket?
    var diameter: DiameterRocket?
    var mass: MassRocket?
    var payload_weights: [PayloadWeights?]
    
    var first_flight: String?
    var country: String?
    var cost_per_launch: Double?
    
    var first_stage: FirstStage?
    var second_stage: SecondStage?
}

struct HeightRocket: Decodable {
    var meters: Double?
    var feet: Double?
}

struct DiameterRocket: Decodable {
    var meters: Double?
    var feet: Double?
}

struct MassRocket: Decodable {
    var kg: Double?
    var lb: Double?
}

struct PayloadWeights: Decodable {
    var kg: Double?
    var lb: Double?
}

struct FirstStage: Decodable {
    var engines: Int?
    var fuel_amount_tons: Double?
    var burn_time_sec: Double?
}

struct SecondStage: Decodable {
    var engines: Int?
    var fuel_amount_tons: Double?
    var burn_time_sec: Double?
}

func request() {
    guard let url = URL(string: "https://api.spacexdata.com/v4/rockets") else {
        return
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        guard error == nil, let data = data else { return }
        
        print (data)
        
        do {
            let jsonRocket = try JSONDecoder().decode([JsonRocket].self, from: data)
            print(jsonRocket)
        } catch {
            print(error)
        }
    }.resume()
}
