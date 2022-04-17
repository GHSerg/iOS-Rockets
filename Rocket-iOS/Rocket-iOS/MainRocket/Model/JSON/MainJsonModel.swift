import Foundation

struct MainJsonModel: Decodable {
    var flickr_images: [String?]
    
    var name: String?
    var id: String?
    
    var height: HeightRocket?
    var diameter: DiameterRocket?
    var mass: MassRocket?
    var payload_weights: [PayloadWeights?]
    
    var first_flight: String?
    var country: String?
    var cost_per_launch: Int?
    
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
    var kg: Int?
    var lb: Int?
}

struct PayloadWeights: Decodable {
    var kg: Int?
    var lb: Int?
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

//final class JsonModel {
//        
//    func request(urlString: String, completion: @escaping ([JsonRocket]?, Error?) -> Void) {
//        guard let url = URL(string: urlString) else {
//            return
//        }
//        
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            DispatchQueue.main.async {
//                guard error == nil, let data = data else { return }
//                
//                do {
//                    let json = try JSONDecoder().decode([JsonRocket].self, from: data)
//                    completion (json, nil)
//                    print(type(of: json))
//                } catch {
//                    print(error)
//                    completion (nil, error)
//                }
//            }
//            
//        }.resume()
//    }
//    
//    func getImageRocket (rockets: [JsonRocket])//, imageRocket: UIImage)
//    {
        //var rockets: [JsonRocket]
        
 //       guard let url = URL(string: (((rockets?[rocket].flickr_images.randomElement()) ?? "none.png") ?? "none.png")) else { return }
        
//        func load(url: URL) {
//            DispatchQueue.global().async { [weak self] in
//                if let data = try? Data(contentsOf: url) {
//                    if let image = UIImage(data: data) {
//                        DispatchQueue.main.async {
//                            self?.image = image
//                        }
//                    }
//                }
//            }
//        }

//    }
//}
