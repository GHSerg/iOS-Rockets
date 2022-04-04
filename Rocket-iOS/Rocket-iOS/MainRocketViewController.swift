//
//  ViewController.swift
//  Rocket-iOS
//
//  Created by Sergey Bodnar on 25.03.2022.
//

import UIKit

class MainRocketViewController: UIViewController {
    
    var array = [
    1,2,3,4,5,6,7,8,9,10,11,12,13
    ]

    @IBOutlet weak var characteristicsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension MainRocketViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharacteristicsTableViewCell", for: indexPath) as? CharacteristicsTableViewCell else { return UITableViewCell()}
        cell.configure(textCell: array[indexPath.row])
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
}


