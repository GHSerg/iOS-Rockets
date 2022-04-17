import Foundation

protocol MainNetworkServiceProtocol {
    func getMainRockets (completion: @escaping (Result<[MainJsonModel]?, Error>) -> ())
}

class MainNetworkService: MainNetworkServiceProtocol {
    func getMainRockets(completion: @escaping (Result<[MainJsonModel]?, Error>) -> ()) {
        let urlString = "https://api.spacexdata.com/v4/rockets"
        
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                guard error == nil, let data = data else { return }
                
                do {
                    let mainRockets = try JSONDecoder().decode([MainJsonModel].self, from: data)
                    completion (.success(mainRockets))
                } catch {
                    completion (.failure(error))
                }
            }
        }.resume()
    }
}
