import Foundation

protocol LaunchesViewControllerProtocol: AnyObject {
    func succes()
    func failure(error: Error)
}

protocol LaunchesPresenterProtocol: AnyObject {
    init (view: LaunchesViewControllerProtocol, launchesNetworkService: LaunchesNetworkServiceProtocol)
    
    var launchesRocket: [LaunchesJsonModel]? { get set }
    
    func getLaunchesRocket()
    func convertDate(dateLaunch: String) -> String
    func filterlaunchesRocket (idRocket: String)
}

class LaunchesPresenter: LaunchesPresenterProtocol {
    
    weak var view: LaunchesViewControllerProtocol?
    let launchesNetworkService: LaunchesNetworkServiceProtocol?
    var launchesRocket: [LaunchesJsonModel]?
    
    required init(view: LaunchesViewControllerProtocol, launchesNetworkService: LaunchesNetworkServiceProtocol) {
        self.view = view
        self.launchesNetworkService = launchesNetworkService
        getLaunchesRocket()
    }
    
    func getLaunchesRocket() {
        launchesNetworkService?.getLaunchesRocket { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let launchesRocket):
                    self.launchesRocket = launchesRocket
                    self.view?.succes()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
                
            }
        }
    }
    
    func convertDate (dateLaunch: String) -> String {
        let formatterDate = DateFormatter()
        formatterDate.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        guard let date = formatterDate.date(from: dateLaunch) else { return "none" }
        
        formatterDate.dateFormat = "dd MMMM, yyyy"
        formatterDate.string(from: date)
        return (formatterDate.string(from: date))
    }
    
    func filterlaunchesRocket (idRocket: String) {
        launchesRocket = launchesRocket?
            .filter { $0.rocket == idRocket }
            .reversed()
    }
}
