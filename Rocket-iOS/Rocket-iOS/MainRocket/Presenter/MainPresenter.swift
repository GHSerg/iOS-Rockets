import Foundation

protocol MainViewControllerProtocol: AnyObject {
    func succes()
    func failure(error: Error)
}

protocol MainPresenterProtocol: AnyObject {
    init (view: MainViewControllerProtocol, mainNetworkService: MainNetworkServiceProtocol)
    
    var mainRockets: [MainJsonModel]? { get set }
    var parametrsRocket: [[String: String]] { get }
    func getMainRockets()
    func setParametrsRocket(indexRocket: Int)
    func convertDate (firstFlight: String) -> String
}

class MainPresenter: MainPresenterProtocol {
    
    weak var view: MainViewControllerProtocol?
    let mainNetworkService: MainNetworkServiceProtocol?
    var mainRockets: [MainJsonModel]?
    
    var settings = ["heightRocket": "ft",
                    "diameterRocket": "ft",
                    "massRocket": "lb",
                    "payloadRocket": "lb"]
    
    var parametrsRocket = [["name": "Высота", "unit": "ft", "value": "200"],
                           ["name": "Диаметр", "unit": "ft", "value": "300"],
                           ["name": "Масса", "unit": "lb", "value": "500"],
                           ["name": "Нагрузка", "unit": "ft", "value": "200"]]
    
    required init(view: MainViewControllerProtocol, mainNetworkService: MainNetworkServiceProtocol) {
        self.view = view
        self.mainNetworkService = mainNetworkService
        
        getMainRockets()
    }
    
    func getMainRockets() {
        mainNetworkService?.getMainRockets { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let mainRockets):
                    self.mainRockets = mainRockets
                    self.view?.succes()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    func convertDate (firstFlight: String) -> String {
        let formatterDate = DateFormatter()
        formatterDate.dateFormat = "yyyy-MM-dd"
        
        guard let date = formatterDate.date(from: firstFlight) else { return "none" }
        
        formatterDate.dateFormat = "dd MMMM, yyyy"
        formatterDate.string(from: date)
        return (formatterDate.string(from: date))
    }
    
    private func loadSettings() {
        settings = UserDefaults.standard.value(forKey: "settings") as? [String: String] ?? settings
    }
    
    func setParametrsRocket (indexRocket: Int) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        loadSettings()
        
        settings.enumerated().forEach { index, _ in
            
            switch index {
            case 0:
                parametrsRocket[index]["unit"] = settings["heightRocket"]
                settings["heightRocket"] == "ft"
                ? parametrsRocket[index]["value"]
                = formatter.string(for: mainRockets?[indexRocket].height?.feet ?? 0)
                : (parametrsRocket[index]["value"]
                   = formatter.string(for: mainRockets?[indexRocket].height?.meters ?? 0))
                
            case 1:
                parametrsRocket[index]["unit"] = settings["diameterRocket"]
                settings["diameterRocket"] == "ft"
                ? parametrsRocket[index]["value"]
                = formatter.string(for: mainRockets?[indexRocket].diameter?.feet ?? 0)
                : (parametrsRocket[index]["value"]
                   = formatter.string(for: mainRockets?[indexRocket].diameter?.meters ?? 0))
                
            case 2:
                parametrsRocket[index]["unit"] = settings["massRocket"]
                settings["massRocket"] == "lb"
                ? parametrsRocket[index]["value"]
                = formatter.string(for: mainRockets?[indexRocket].mass?.lb ?? 0)
                : (parametrsRocket[index]["value"]
                   = formatter.string(for: mainRockets?[indexRocket].mass?.kg ?? 0))
                
            case 3:
                parametrsRocket[index]["unit"] = settings["payloadRocket"]
                settings["payloadRocket"] == "lb"
                ? parametrsRocket[index]["value"]
                = formatter.string(for: mainRockets?[indexRocket].payload_weights.first??.lb ?? 0)
                : (parametrsRocket[index]["value"]
                   = formatter.string(for: mainRockets?[indexRocket].payload_weights.last??.kg ?? 0))
                
            default:
                return
            }
        }
    }
}
