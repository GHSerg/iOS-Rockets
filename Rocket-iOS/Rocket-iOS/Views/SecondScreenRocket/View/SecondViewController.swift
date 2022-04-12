//
//  SecondViewController.swift
//  Rocket-iOS
//
//  Created by Sergey Bodnar on 11.04.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    var nameRocket: String?
    var rocketLaunches: [SecondViewJsonRocket]? {
        didSet {
           // print (self.rocketLaunches ?? <#default value#>)
            rocketLaunches = rocketLaunches?
                .filter{ $0.rocket == idRocket }
                .reversed()
           // convertDate()
          //  setData()
            self.rocketTableView.reloadData()
            
        }
    }
    
    var idRocket: String?

    @IBOutlet weak var rocketNameTitleLabel: UILabel!
    
    @IBOutlet weak var rocketTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.rocketTableView.register(UINib(nibName: "SecondScreenTableViewCell", bundle: nil),
        forCellReuseIdentifier: "SecondScreenTableViewCell")
        
        requestSecondView(urlString: "https://api.spacexdata.com/v4/launches") { json, error in
            self.rocketLaunches = json
            //print (self.rocketLaunches)
        }
        
        self.rocketNameTitleLabel.text = self.nameRocket
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rocketLaunches?.count ?? 0
    }
//    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//            return 16
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SecondScreenTableViewCell", for: indexPath) as? SecondScreenTableViewCell else { return UITableViewCell() }
        cell.configure(name: rocketLaunches?[indexPath.row].name ?? "none",
                       date: convertDate(dateLaunch:  rocketLaunches?[indexPath.row].date_utc ?? "none"),
                       image: "\(rocketLaunches?[indexPath.row].success ?? false).png")
        return cell
    }
}

// MARK: - Set Data

extension SecondViewController {

    func convertDate(dateLaunch: String) -> String {
       
                        let formatterDate = DateFormatter()
                        let timestamp = dateLaunch
                        formatterDate.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                        let date = formatterDate.date(from: timestamp)
                        formatterDate.dateFormat = "dd MMMM, yyyy"
                        print (formatterDate.string(from: date!))
                        //firstFlightLabel.text = formatterDate.string(from: date!)
                        return (formatterDate.string(from: date!))
    }
}
