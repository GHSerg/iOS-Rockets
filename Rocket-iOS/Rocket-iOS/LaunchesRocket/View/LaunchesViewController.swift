import UIKit

class LaunchesViewController: UIViewController {
    
    var launchesPresenter: LaunchesPresenterProtocol?
    
    @IBOutlet weak var rocketNameTitleLabel: UILabel!
    @IBOutlet weak var rocketTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rocketTableView.register(UINib(nibName: "LaunchesTableViewCell", bundle: nil),
                                 forCellReuseIdentifier: "LaunchesTableViewCell")
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension LaunchesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return launchesPresenter?.launchesRocket?.count ?? 0
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LaunchesTableViewCell", for: indexPath) as? LaunchesTableViewCell else { return UITableViewCell() }
        cell.configure(name: launchesPresenter?.launchesRocket?[indexPath.row].name ?? "none",
                       date: launchesPresenter?.convertDate(dateLaunch: launchesPresenter?.launchesRocket?[indexPath.row].date_utc ?? "none") ?? "none",
                       image: "\(launchesPresenter?.launchesRocket?[indexPath.row].success ?? false).png"
        )
        return cell
    }
}

extension LaunchesViewController: LaunchesViewControllerProtocol {
    func succes() {
        rocketTableView.reloadData()
    }
    
    func failure(error: Error) {
        print ("error")
    }
}

// MARK: - Set Data


