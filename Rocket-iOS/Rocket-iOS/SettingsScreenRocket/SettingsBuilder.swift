import UIKit

protocol Builder {
    static func createSettingsViewController() -> UIViewController
}

class SettingsBuilder: Builder {
    static func createSettingsViewController() -> UIViewController {
        let model = SettingsDataModel(model: ["heightRocket": "ft",
                                              "diameterRocket": "ft",
                                              "massRocket": "lb",
                                              "payloadRocket": "lb"])
        guard let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController else { return UIViewController() }
        
        let presenter = SettingsPresenter (view: view, settings: model)
        view.settingsPresenter = presenter
        return view
    }
    
    
}


