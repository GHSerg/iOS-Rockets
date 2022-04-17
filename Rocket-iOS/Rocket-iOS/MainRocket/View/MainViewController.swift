import UIKit

class MainViewController: UIViewController {
    
    var mainPresenter: MainPresenterProtocol?
    var indexRocket = 0
    
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
        
        setupLayout()
        MainBuilder.buildMainViewController(view: self)
    }
    
    @IBAction func chooseRocketPageControlView(_ sender: Any) {
        indexRocket = pageControlView.currentPage
        succes()
    }
    
    @IBAction func launchesRocketButton(_ sender: Any) {
        let controller = LaunchesBuilder.createLaunchesViewController()
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func settingsActionRocketButton(_ sender: Any) {
        let controller = SettingsBuilder.createSettingsViewController()
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

// MARK: - InfoRocketCollectionViewCell

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        mainPresenter?.parametrsRocket.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as? MainCollectionViewCell else { return MainCollectionViewCell()}
        
        cell.configure(nameCell: mainPresenter?.parametrsRocket[indexPath.item]["name"] ?? "none",
                       unitCell: mainPresenter?.parametrsRocket[indexPath.item]["unit"] ?? "none",
                       valueCell: mainPresenter?.parametrsRocket[indexPath.item]["value"] ?? "none")
        cell.layer.cornerRadius = Metric.viewRound
        return cell
    }
    
    func setDescriptionRocket ()
    {
        let countryDictionary = [
            "none": "Отсутствует в словаре",
            "Republic of the Marshall Islands": "Маршалловы Острова",
            "United States": "США"
        ]
        
        setImageRocket()
        
        nameRocketLabel.text = mainPresenter?.mainRockets?[indexRocket].name
        firstFlightLabel.text = mainPresenter?.convertDate(firstFlight:
                                                            mainPresenter?.mainRockets?[indexRocket].first_flight ?? "none")
        countryLabel.text = countryDictionary[mainPresenter?.mainRockets?[indexRocket].country ?? "none"]
        costLabel.text = ("$\((mainPresenter?.mainRockets?[indexRocket].cost_per_launch ?? 0)/1_000_000 ) млн")
        
        enginesFirstStageLabel.text = ("\( mainPresenter?.mainRockets?[indexRocket].first_stage?.engines ?? 0)")
        fuelFirstStageLabel.text = ("\( mainPresenter?.mainRockets?[indexRocket].first_stage?.fuel_amount_tons ?? 0)")
        burnSecFirstStageLabel.text = ("\( mainPresenter?.mainRockets?[indexRocket].first_stage?.burn_time_sec ?? 0)")
        
        enginesSecondStageLabel.text = ("\( mainPresenter?.mainRockets?[indexRocket].second_stage?.engines ?? 0)")
        fuelSecondStageLabel.text = ("\( mainPresenter?.mainRockets?[indexRocket].second_stage?.fuel_amount_tons ?? 0)")
        burnSecSecondStageLabel.text = ("\( mainPresenter?.mainRockets?[indexRocket].second_stage?.burn_time_sec ?? 0)")
    }
    
    func setImageRocket () {
        guard let url = URL(string: (mainPresenter?.mainRockets?[indexRocket].flickr_images.randomElement() ?? "none") ?? "none")  else { return }
        rocketImageView.load(url: url)
    }
    
    func setNumberOfPagePageControl() {
        pageControlView.numberOfPages = mainPresenter?.parametrsRocket.count ?? 0
    }
}

// MARK: - Constants

extension MainViewController: MainViewControllerProtocol {
    func succes() {
        setDescriptionRocket()
        mainPresenter?.setParametrsRocket(indexRocket: indexRocket)
        infoCollectionView.reloadData()
        setNumberOfPagePageControl()
    }
    
    func failure(error: Error) {

    }
    
}

extension MainViewController {
    enum Metric {
        static let viewRound: CGFloat = 32
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
