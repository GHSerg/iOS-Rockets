import UIKit

class LaunchesViewController: UIViewController {
    
    var launchesPresenter: LaunchesPresenterProtocol?
    var rocketName: String?
    var idRocket: String?
    
    @IBOutlet weak var rocketNameTitleLabel: UILabel!
    @IBOutlet weak var rocketTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        


        setupView() // настройки для view
        
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    func setupView() {
        rocketTableView.register(UINib(nibName: "LaunchesTableViewCell", bundle: nil),
                                 forCellReuseIdentifier: "LaunchesTableViewCell")
        rocketNameTitleLabel.text = rocketName
        
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
        guard let idRocket = idRocket else { return }
        launchesPresenter?.filterlaunchesRocket(idRocket: idRocket)
        rocketTableView.reloadData()
    }
    
    func failure(error: Error) {
        print ("error")
    }
}

// MARK: - Set Data


