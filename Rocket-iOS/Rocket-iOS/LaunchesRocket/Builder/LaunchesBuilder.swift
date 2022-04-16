import UIKit

protocol LaunchesBuilderProtocol {
    static func createLaunchesViewController() -> UIViewController
}

class LaunchesBuilder: LaunchesBuilderProtocol {
    
    static func createLaunchesViewController() -> UIViewController {
        guard let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LaunchesViewController") as? LaunchesViewController else { return UIViewController() }
        let networkService = NetworkService()
        let presenter = LaunchesPresenter (view: view, networkService: networkService)
        view.launchesPresenter = presenter
        return view
    }   
}


