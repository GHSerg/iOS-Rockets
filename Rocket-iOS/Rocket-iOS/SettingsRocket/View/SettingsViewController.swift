import UIKit

class SettingsViewController: UIViewController {
    
    var settingsPresenter: SettingsPresenterProtocol?
    
    @IBOutlet weak var heightRocketChoice: UISegmentedControl!
    @IBOutlet weak var diameterRocketChoice: UISegmentedControl!
    @IBOutlet weak var massRocketChoice: UISegmentedControl!
    @IBOutlet weak var payloadRocketChoice: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsPresenter?.loadSettings()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        settingsPresenter?.saveSettings()
    }
    
    @IBAction func heightRocketChoice(_ sender: Any) {
        settingsPresenter?.setSettingsInfoRocket(name: "heightRocket",
                                                 segmentIndex: heightRocketChoice.selectedSegmentIndex)
    }
    
    @IBAction func diameterRocketChoice(_ sender: Any) {
        settingsPresenter?.setSettingsInfoRocket(name: "diameterRocket",
                                                 segmentIndex: diameterRocketChoice.selectedSegmentIndex)
    }
    
    @IBAction func massRocketChoice(_ sender: Any) {
        settingsPresenter?.setSettingsInfoRocket(name: "massRocket",
                                                 segmentIndex: massRocketChoice.selectedSegmentIndex)
    }
    
    @IBAction func payloadRocketChoice(_ sender: Any) {
        settingsPresenter?.setSettingsInfoRocket(name: "payloadRocket",
                                                 segmentIndex: payloadRocketChoice.selectedSegmentIndex)
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - Extension

extension SettingsViewController: SettingsViewControllerProtocol {
    
    func setSegmentedControll(settings: SettingsDataModel) {
        
        settings.model["heightRocket"] == "ft"
        ? (heightRocketChoice.selectedSegmentIndex = 1)
        : (heightRocketChoice.selectedSegmentIndex = 0)
        
        settings.model["diameterRocket"] == "ft"
        ? (diameterRocketChoice.selectedSegmentIndex = 1)
        : (diameterRocketChoice.selectedSegmentIndex = 0)
        
        settings.model["massRocket"] == "lb"
        ? (massRocketChoice.selectedSegmentIndex = 1)
        : (massRocketChoice.selectedSegmentIndex = 0)
        
        settings.model["payloadRocket"] == "lb"
        ? (payloadRocketChoice.selectedSegmentIndex = 1)
        : (payloadRocketChoice.selectedSegmentIndex = 0)
    }
}
