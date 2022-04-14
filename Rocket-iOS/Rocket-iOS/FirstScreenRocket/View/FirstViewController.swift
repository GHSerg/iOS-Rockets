import UIKit

class FirstViewController: UIViewController {
    
    var descriptionDataRocket = [DescriptionDataRocket]()
    var infoDataRocket = [InfoDataRocket]()

    @IBOutlet weak var infoRocketView: UIView!
    @IBOutlet weak var infoCollectionView: UICollectionView!
    @IBOutlet weak var nameSettingsRocketView: UIView!
    @IBOutlet weak var pageControlView: UIPageControl!
    @IBOutlet weak var launchesRocketButtonOutlet: UIButton!
    
    
    @IBOutlet weak var rocketImageView: UIImageView!
    @IBOutlet weak var nameRocketLabel: UILabel!
    
    @IBOutlet weak var firstFlightLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    
    @IBOutlet weak var enginesFirstStageLabel: UILabel!
    @IBOutlet weak var fuelFirstStageLabel: UILabel!
    @IBOutlet weak var burnSecFirstStageLabel: UILabel!
    
    
    @IBOutlet weak var enginesSecondStageLabel: UILabel!
    @IBOutlet weak var fuelSecondStageLabel: UILabel!
    @IBOutlet weak var burnSecSecondStageLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        //        request(urlString: "https://api.spacexdata.com/v4/rockets") { json, error in
        //            self.rockets = json
        //        }
        
        setupLayout()
    }
    
    @IBAction func launchesRocketButton(_ sender: Any) {
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal
      //  controller.idRocket = rockets?[rocket].id
      //  controller.nameRocket = rockets?[rocket].name
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func settingsActionRocketButton(_ sender: Any) {
        
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController else { return }
       // controller.delegate = self
        self.present(controller, animated: true, completion: nil)
    }
    
    private func setupLayout() {
        nameSettingsRocketView.layer.cornerRadius = Metric.viewRound
        nameSettingsRocketView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

// MARK: - Set Data Rocket

extension FirstViewController {
    
    func setDataInfoRocket (infoDataRocket: [InfoDataRocket])
    {
        self.infoDataRocket = infoDataRocket
        infoCollectionView.reloadData()
    }
    
    func setDataDescriptionRocket ()//(dataDescriptionRocket: )
    {
        firstFlightLabel.text = ""
        countryLabel.text = ""
        costLabel.text = ""
        
        enginesFirstStageLabel.text = ""
        fuelFirstStageLabel.text = ""
        burnSecFirstStageLabel.text = ""
        
        enginesSecondStageLabel.text = ""
        fuelSecondStageLabel.text = ""
        burnSecSecondStageLabel.text = ""
    }
}

// MARK: - InfoRocketCollectionViewCell

extension FirstViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 4 //infoDataRocket.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfoRocketCollectionViewCell", for: indexPath) as? InfoRocketCollectionViewCell else { return InfoRocketCollectionViewCell()}
        
        cell.configure(nameCell: "name",
                       unitCell: "unit",
                       valueCell: "value")
        cell.layer.cornerRadius = Metric.viewRound
        return cell
    }
}

// MARK: - Constants

extension FirstViewController {
    enum Metric {
        static let viewRound: CGFloat = 32
    }
}

extension UIImageView {
//    func load(url: URL) {
//        DispatchQueue.global().async { [weak self] in
//            if let data = try? Data(contentsOf: url) {
//                if let image = UIImage(data: data) {
//                    DispatchQueue.main.async {
//                        self?.image = image
//                    }
//                }
//            }
//        }
//    }
}

//cell.configure(nameCell: infoDataRocket[indexPath.item]["name"] ?? "none",
//               unitCell: infoDataRocket[indexPath.item]["unit"] ?? "none",
//               valueCell: infoDataRocket[indexPath.item]["value"] ?? "none")
