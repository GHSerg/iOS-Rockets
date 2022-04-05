//
//  ViewController.swift
//  Rocket-iOS
//
//  Created by Sergey Bodnar on 25.03.2022.
//

import UIKit

class MainRocketViewController: UIViewController {
    
    var arrayTestDecs = [
     "Первый запуск","Страна","Стоимость запуска","Количество двигателей","Количество топлива","Время сгорания","Количество двигателей","Количество топлива","Время сгорания"
    ]

    var arrayTestInfo = [
     "Высота","Диаметр","Масса","Нагрузка"
    ]
    @IBOutlet weak var infoRocketCollectionView: UICollectionView!
    
    @IBOutlet weak var descriptionTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension MainRocketViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayTestDecs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell", for: indexPath) as? DescriptionTableViewCell else { return UITableViewCell()}
        cell.configure(textCell: arrayTestDecs[indexPath.row])
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
}

extension MainRocketViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayTestInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfoRocketCollectionViewCell", for: indexPath) as? InfoRocketCollectionViewCell else { return InfoRocketCollectionViewCell()}
        cell.configure(textCell: arrayTestInfo[indexPath.row])
        //cell.accessoryType = .disclosureIndicator
        return cell
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return arrayTestDecs.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell", for: indexPath) as? DescriptionTableViewCell else { return UITableViewCell()}
//        cell.configure(textCell: arrayTestDecs[indexPath.row])
//        cell.accessoryType = .disclosureIndicator
//        return cell
//    }
    
}


