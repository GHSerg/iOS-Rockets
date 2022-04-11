//
//  ViewController.swift
//  Rocket-iOS
//
//  Created by Sergey Bodnar on 25.03.2022.
//

import UIKit

class MainRocketViewController: UIViewController {
    
    var rocket = 0
    var rockets: [JsonRocket]?

    let countryDictionary = [
        "none": "Отсутствует в словаре",
        "Republic of the Marshall Islands": "Маршалловы Острова",
        "United States": "США"
    ]
    
    var infoRocket = [
        ["name": "Высота", "unit": "ft", "value": "0.0"],
        ["name": "Диаметр", "unit": "ft", "value": "0.0"],
        ["name": "Масса", "unit": "lb", "value": "0.0"],
        ["name": "Нагрузка", "unit": "lb", "value": "0.0"]
    ]
    
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
        
        request(urlString: "https://api.spacexdata.com/v4/rockets") { json, error in
            self.rockets = json
        }
        
        setupLayout() // констрейнты, стеки
        
        setData()
        //print (arrayTestInfotext[0][0] ?? "nil")
        
    }
    
    private func setupLayout() {
        nameSettingsRocketView.layer.cornerRadius = Metric.viewRound
        nameSettingsRocketView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func launchesRocketButton(_ sender: Any) {
    }
    
    @IBAction func settingsActionRocketButton(_ sender: Any) {
        
        setData()
    }
}

// MARK: - Set Data

extension MainRocketViewController {
    
    func setData () {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        rocket += 1
        if rocket == infoRocket.count { rocket = 0 }
        
        infoRocket[0]["value"] = formatter.string(for: rockets?[rocket].height?.feet ?? 0)
        infoRocket[1]["value"] = formatter.string(for: rockets?[rocket].diameter?.feet ?? 0)
        infoRocket[2]["value"] = formatter.string(for: rockets?[rocket].mass?.lb ?? 0)
        infoRocket[3]["value"] = formatter.string(for: rockets?[rocket].payload_weights.first??.lb ?? 0)

        guard let url = URL(string: (((rockets?[rocket].flickr_images.randomElement()) ?? "https://farm1.staticflickr.com/745/32394687645_a9c54a34ef_b.jpg") ?? "https://farm1.staticflickr.com/745/32394687645_a9c54a34ef_b.jpg")) else {
            return
        }
        rocketImageView.load(url: url)
        nameRocketLabel.text = rockets?[rocket].name
        
        let formatterDate = DateFormatter()
        let timestamp = rockets?[rocket].first_flight ?? "2000-12-01"
        formatterDate.dateFormat = "yyyy-MM-dd"
        let date = formatterDate.date(from: timestamp)
        formatterDate.dateFormat = "dd MMMM, yyyy"

        firstFlightLabel.text = formatterDate.string(from: date!)
        countryLabel.text = countryDictionary[rockets?[rocket].country ??  "none"]
        costLabel.text = ("$\((rockets?[rocket].cost_per_launch ?? 0)/1_000_000 ) млн")
        
        enginesFirstStageLabel.text = ("\(rockets?[rocket].first_stage?.engines ?? 0)")
        fuelFirstStageLabel.text = ("\(rockets?[rocket].first_stage?.fuel_amount_tons ?? 0)")
        burnSecFirstStageLabel.text = ("\(rockets?[rocket].first_stage?.burn_time_sec ?? 0)")
        
        enginesSecondStageLabel.text = ("\(rockets?[rocket].second_stage?.engines ?? 0)")
        fuelSecondStageLabel.text = ("\(rockets?[rocket].second_stage?.fuel_amount_tons ?? 0)")
        burnSecSecondStageLabel.text = ("\(rockets?[rocket].second_stage?.burn_time_sec ?? 0)")
        
        infoCollectionView.reloadData()
    }
}

// MARK: - InfoRocketCollectionViewCell

extension MainRocketViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return infoRocket.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfoRocketCollectionViewCell", for: indexPath) as? InfoRocketCollectionViewCell else { return InfoRocketCollectionViewCell()}
    
        cell.configure(nameCell: infoRocket[indexPath.item]["name"] ?? "none",
                       unitCell: infoRocket[indexPath.item]["unit"] ?? "none",
                       valueCell: infoRocket[indexPath.item]["value"] ?? "none")
        cell.layer.cornerRadius = Metric.viewRound
        return cell
    }
}

// MARK: - Constants

extension MainRocketViewController {
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
