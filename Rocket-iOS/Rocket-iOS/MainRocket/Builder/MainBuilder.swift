import UIKit

protocol MainBuilderProtocol {
    static func buildMainViewController(view: MainViewController)
}

class MainBuilder: MainBuilderProtocol {



    static func buildMainViewController(view: MainViewController) {

        let networkService = MainNetworkService()
        let presenter = MainPresenter (view: view, mainNetworkService: networkService)
        view.mainPresenter = presenter

    }
}


