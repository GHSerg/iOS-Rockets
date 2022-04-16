import Foundation

protocol SettingsViewControllerProtocol: AnyObject {
    func setSegmentedControll (settings: SettingsDataModel)
}

protocol SettingsPresenterProtocol: AnyObject{
    init (view: SettingsViewControllerProtocol, settings: SettingsDataModel)
    func saveSettings()
    func loadSettings()
    func setSettingsInfoRocket(name: String, segmentIndex: Int)
}


class SettingsPresenter: SettingsPresenterProtocol {

    weak var view: SettingsViewControllerProtocol?
    var settings: SettingsDataModel
    
    required init(view: SettingsViewControllerProtocol, settings: SettingsDataModel) {
        self.view = view
        self.settings = settings
    }
 
    func saveSettings() {
        UserDefaults.standard.set(settings.model, forKey: "settings")
    }
    
    func loadSettings() {
        settings.model = UserDefaults.standard.value(forKey: "settings") as? [String: String] ?? settings.model
        view?.setSegmentedControll(settings: settings)
    }
    
    func setSettingsInfoRocket(name: String, segmentIndex: Int) {
        switch name {
        case "heightRocket": segmentIndex == 1
            ? (settings.model["heightRocket"] = "ft")
            : (settings.model["heightRocket"] = "m")
        case "diameterRocket": segmentIndex == 1
            ? (settings.model["diameterRocket"] = "ft")
            : (settings.model["diameterRocket"] = "m")
        case "massRocket": segmentIndex == 1
            ? (settings.model["massRocket"] = "lb")
            : (settings.model["massRocket"] = "kg")
        case "payloadRocket": segmentIndex == 1
            ? (settings.model["payloadRocket"] = "lb")
            : (settings.model["payloadRocket"] = "kg")
        default:
            return
        }
        print(settings)
    }
    
}
