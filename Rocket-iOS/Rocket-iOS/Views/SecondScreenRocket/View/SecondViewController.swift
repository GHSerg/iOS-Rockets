//
//  SecondViewController.swift
//  Rocket-iOS
//
//  Created by Sergey Bodnar on 11.04.2022.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var rocketNameTitleLabel: UILabel!
    
    @IBOutlet weak var rocketTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.rocketTableView.register(UINib(nibName: "SecondScreenTableViewCell", bundle: nil),
        forCellReuseIdentifier: "SecondScreenTableViewCell")
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 16
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SecondScreenTableViewCell", for: indexPath) as? SecondScreenTableViewCell else { return UITableViewCell() }
        cell.layer.cornerRadius = 24
        return cell
    }
}
