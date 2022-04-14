import UIKit

protocol ThirdViewControllerDelegate: AnyObject {
    func setDataInfoRocket (measurementValuesInfoRocket: [[String: String]])
}

class ThirdViewController: UIViewController {
    
    weak var delegate: ThirdViewControllerDelegate?
    
    @IBOutlet weak var heightInfoRocket: UISegmentedControl!
    
    var measurementValuesInfoRocket = [
        ["name": "Высота", "unit": "ft"],
        ["name": "Диаметр", "unit": "ft"],
        ["name": "Масса", "unit": "lb"],
        ["name": "Нагрузка", "unit": "lb"]
    ] {
        didSet {
            //self.delegate?.setValueMyTimer(counter: self.counter, timerString: self.timerString)
            delegate?.setDataInfoRocket(measurementValuesInfoRocket: self.measurementValuesInfoRocket)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func heightChoice(_ sender: Any) {
        switch heightInfoRocket.selectedSegmentIndex {
        case 0:
            measurementValuesInfoRocket[0]["unit"] = "m"
        case 1:
            measurementValuesInfoRocket[0]["unit"] = "ft"

        default:
            print("n jn j")
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
