import Foundation

final class JsonModel {
        
    func request(urlString: String, completion: @escaping ([JsonRocket]?, Error?) -> Void) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                guard error == nil, let data = data else { return }
                
                do {
                    let json = try JSONDecoder().decode([JsonRocket].self, from: data)
                    completion (json, nil)
                    print(type(of: json))
                } catch {
                    print(error)
                    completion (nil, error)
                }
            }
            
        }.resume()
    }
    
    func getImageRocket (rockets: [JsonRocket])//, imageRocket: UIImage)
    {
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

    }
}
