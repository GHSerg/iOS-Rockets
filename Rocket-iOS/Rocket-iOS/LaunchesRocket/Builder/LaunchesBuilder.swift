import UIKit

protocol LaunchesBuilderProtocol {
    static func createLaunchesViewController(rocketName: String, idRocket: String) -> UIViewController
}

class LaunchesBuilder: LaunchesBuilderProtocol {
    
    static func createLaunchesViewController(rocketName: String, idRocket: String ) -> UIViewController {
        guard let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LaunchesViewController") as? LaunchesViewController else { return UIViewController() }
        let launchesNetworkService = LaunchesNetworkService()
        let presenter = LaunchesPresenter (view: view, launchesNetworkService: launchesNetworkService)
        view.rocketName = rocketName
        view.idRocket = idRocket
        view.launchesPresenter = presenter
        return view
    }   
}
