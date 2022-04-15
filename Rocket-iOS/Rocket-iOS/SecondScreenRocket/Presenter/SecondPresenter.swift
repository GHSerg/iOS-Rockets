//import Foundation
//
//class SecondPresent {
//    
//    //var rocketData = SecondJsonModel()
//    
//    var nameRocket: String?
//    var rocketLaunches: [rocketData]? {
//        didSet {
//           // print (self.rocketLaunches ?? default value)
//            rocketLaunches = rocketLaunches?
//                .filter{ $0.rocket == idRocket }
//                .reversed()
//           // convertDate()
//          //  setData()
//          //  self.rocketTableView.reloadData()
//            
//        }
//    }
//    
//    var idRocket: String?
//    
//   // self.rocketTableView.register(UINib(nibName: "SecondScreenTableViewCell", bundle: nil),
//    forCellReuseIdentifier: "SecondScreenTableViewCell")
//    
//    requestSecondView(urlString: "https://api.spacexdata.com/v4/launches") { json, error in
//        self.rocketLaunches = json
//        //print (self.rocketLaunches)
//    }
//    
//    self.rocketNameTitleLabel.text = self.nameRocket
//    
//    
//    
//    
//    
//    extension SecondViewController {
//
//        func convertDate(dateLaunch: String) -> String {
//           
//                            let formatterDate = DateFormatter()
//                            let timestamp = dateLaunch
//                            formatterDate.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
//                            let date = formatterDate.date(from: timestamp)
//                            formatterDate.dateFormat = "dd MMMM, yyyy"
//                            print (formatterDate.string(from: date!))
//                            //firstFlightLabel.text = formatterDate.string(from: date!)
//                            return (formatterDate.string(from: date!))
//        }
//    }
//    
//    func requestDataRocket(urlString: String, completion: @escaping ([rocketData]?, Error?) -> Void) {
//        guard let url = URL(string: urlString) else {
//            return
//        }
//        
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            DispatchQueue.main.async {
//                guard error == nil, let data = data else { return }
//                
//                do {
//                    let json = try JSONDecoder().decode([rocketData].self, from: data)
//                    completion (json, nil)
//                    // print(json)
//                } catch {
//                    //   print(error)
//                    completion (nil, error)
//                }
//            }
//            
//        }.resume()
//    }
//    
//}
//
////    var nameRocket: String?
////    var rocketLaunches: [SecondViewJsonRocket]? {
////        didSet {
////           // print (self.rocketLaunches ?? <#default value#>)
////            rocketLaunches = rocketLaunches?
////                .filter{ $0.rocket == idRocket }
////                .reversed()
////           // convertDate()
////          //  setData()
////            self.rocketTableView.reloadData()
////
////        }
////    }
////
////    var idRocket: String?
//
////        self.rocketTableView.register(UINib(nibName: "SecondScreenTableViewCell", bundle: nil),
////        forCellReuseIdentifier: "SecondScreenTableViewCell")
////
////        requestSecondView(urlString: "https://api.spacexdata.com/v4/launches") { json, error in
////            self.rocketLaunches = json
////            //print (self.rocketLaunches)
////        }
////
////        self.rocketNameTitleLabel.text = self.nameRocket
//
////
////    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
////            return 16
////    }
//
//
////extension SecondViewController {
////
////    func convertDate(dateLaunch: String) -> String {
////
////                        let formatterDate = DateFormatter()
////                        let timestamp = dateLaunch
////                        formatterDate.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
////                        let date = formatterDate.date(from: timestamp)
////                        formatterDate.dateFormat = "dd MMMM, yyyy"
////                        print (formatterDate.string(from: date!))
////                        //firstFlightLabel.text = formatterDate.string(from: date!)
////                        return (formatterDate.string(from: date!))
////    }
////}
