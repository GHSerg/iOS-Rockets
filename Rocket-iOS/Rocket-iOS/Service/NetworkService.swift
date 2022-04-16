import Foundation

protocol NetworkServiceProtocol {
    func getLaunchesRocket (completion: @escaping (Result<[LaunchesJsonModel]?, Error>) -> ())
}

class NetworkService: NetworkServiceProtocol {
    func getLaunchesRocket(completion: @escaping (Result<[LaunchesJsonModel]?, Error>) -> ()) {
        let urlString = "https://api.spacexdata.com/v4/launches"
        
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                guard error == nil, let data = data else { return }
                
                do {
                    let launchesRocket = try JSONDecoder().decode([LaunchesJsonModel].self, from: data)
                    completion (.success(launchesRocket))
                } catch {
                    completion (.failure(error))
                }
            }
        }.resume()
    }  
}
