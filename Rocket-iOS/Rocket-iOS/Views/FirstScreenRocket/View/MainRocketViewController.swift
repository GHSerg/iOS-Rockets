//
//  ViewController.swift
//  Rocket-iOS
//
//  Created by Sergey Bodnar on 25.03.2022.
//

import UIKit

class MainRocketViewController: UIViewController {
    
    var rockets: [JsonRocket]?
    //var rocket: Int?
    // var descriptionArray: String
    //    var arrayTestDecs = [
    //        "Первый запуск", "Страна", "Стоимость запуска", "Количество двигателей", "Количество топлива", "Время сгорания", "Количество двигателей", "Количество топлива", "Время сгорания"
    //    ]
    //
    var arrayTestInfo = [
        "Высота, ft", "Диаметр, ft", "Масса, lb", "Нагрузка, lb"
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
            print (json ?? "json = nil")
            print(json?[0].name ?? "nil")
            print(json?[0].height?.meters ?? "nil")
            print(type(of: json![0] ) )
            self.rockets = json
        }
        
        setupLayout() // констрейнты, стеки
        
        setData()
        
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

//// MARK: - DescriptionTableViewCell
//
//extension MainRocketViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return arrayTestDecs.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell", for: indexPath) as? DescriptionTableViewCell else { return UITableViewCell()}
//        cell.configure(textCell: arrayTestDecs[indexPath.row])
//        return cell
//    }
//
//}

// MARK: - Set Data

extension MainRocketViewController {
    
    func setData () {
        let rocket = 3
        nameRocketLabel.text = rockets?[rocket].name
        
        firstFlightLabel.text = rockets?[rocket].first_flight
        countryLabel.text = rockets?[rocket].country
        costLabel.text = ("$\((rockets?[rocket].cost_per_launch ?? 0)/1_000_000 ) млн")
        
        enginesFirstStageLabel.text = ("\(rockets?[rocket].first_stage?.engines ?? 0)")
        fuelFirstStageLabel.text = ("\(rockets?[rocket].first_stage?.fuel_amount_tons ?? 0)")
        burnSecFirstStageLabel.text = ("\(rockets?[rocket].first_stage?.burn_time_sec ?? 0)")
        
        enginesSecondStageLabel.text = ("\(rockets?[rocket].second_stage?.engines ?? 0)")
        fuelSecondStageLabel.text = ("\(rockets?[rocket].second_stage?.fuel_amount_tons ?? 0)")
        burnSecSecondStageLabel.text = ("\(rockets?[rocket].second_stage?.burn_time_sec ?? 0)")
    }
}

// MARK: - InfoRocketCollectionViewCell

extension MainRocketViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rockets?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfoRocketCollectionViewCell", for: indexPath) as? InfoRocketCollectionViewCell else { return InfoRocketCollectionViewCell()}
        cell.configure(textCell: arrayTestInfo[indexPath.item])
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
