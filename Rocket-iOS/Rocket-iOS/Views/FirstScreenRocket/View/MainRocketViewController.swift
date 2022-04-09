//
//  ViewController.swift
//  Rocket-iOS
//
//  Created by Sergey Bodnar on 25.03.2022.
//

import UIKit

class MainRocketViewController: UIViewController {
    
    // var descriptionArray: String
    var arrayTestDecs = [
        "Первый запуск", "Страна", "Стоимость запуска", "Количество двигателей", "Количество топлива", "Время сгорания", "Количество двигателей", "Количество топлива", "Время сгорания"
    ]
    
    var arrayTestInfo = [
        "Высота", "Диаметр", "Масса", "Нагрузка"
    ]
    
    @IBOutlet weak var rocketImageView: UIImageView!
    
    @IBOutlet weak var nameRocketLabel: UILabel!
    
    @IBOutlet weak var infoRocketView: UIView!
    @IBOutlet weak var infoCollectionView: UICollectionView!
    
    @IBOutlet weak var descriptionTableView: UITableView!
    
    @IBOutlet weak var pageControlView: UIPageControl!
    
    @IBOutlet weak var launchesRocketButtonOutlet: UIButton!
    
    @IBOutlet weak var nameSettingsRocketView: UIView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout() // констрейнты, стеки
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
        
        request()
        
    }
}

// MARK: - DescriptionTableViewCell

extension MainRocketViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayTestDecs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell", for: indexPath) as? DescriptionTableViewCell else { return UITableViewCell()}
        cell.configure(textCell: arrayTestDecs[indexPath.row])
        return cell
    }
    
}

// MARK: - InfoRocketCollectionViewCell

extension MainRocketViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayTestInfo.count
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
