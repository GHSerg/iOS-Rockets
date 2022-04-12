//
//  SecondViewJsonRocket.swift
//  Rocket-iOS
//
//  Created by Sergey Bodnar on 12.04.2022.
//


import Foundation

struct SecondViewJsonRocket: Decodable {
    var name: String?
    var date_utc: String?
    var rocket: String?
    var success: Bool?
    
}



func requestSecondView(urlString: String, completion: @escaping ([SecondViewJsonRocket]?, Error?) -> Void) {
    guard let url = URL(string: urlString) else {
        return
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        DispatchQueue.main.async {
            guard error == nil, let data = data else { return }

            do {
                let json = try JSONDecoder().decode([SecondViewJsonRocket].self, from: data)
                completion (json, nil)
               // print(json)
            } catch {
             //   print(error)
                completion (nil, error)
            }
        }

    }.resume()
}

