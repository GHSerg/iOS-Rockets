import Foundation

protocol LaunchesNetworkServiceProtocol {
    func getLaunchesRocket (completion: @escaping (Result<[LaunchesJsonModel]?, Error>) -> Void)
}

class LaunchesNetworkService: LaunchesNetworkServiceProtocol {
    func getLaunchesRocket(completion: @escaping (Result<[LaunchesJsonModel]?, Error>) -> Void) {
        let urlString = "https://api.spacexdata.com/v4/launches"

        guard let url = URL(string: urlString) else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, _, error in
            DispatchQueue.main.async {
                guard error == nil, let data = data else { return }

                do {
                    let launchesRocket = try JSONDecoder().decode([LaunchesJsonModel].self, from: data)
                    completion(.success(launchesRocket))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
