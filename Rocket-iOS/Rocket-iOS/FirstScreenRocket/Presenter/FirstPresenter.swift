import Foundation

class FirstViewModel {
    var dataRocketModel = DataRocketModel()
    var jsonModel = JsonModel()
    
    
    
}

//, ThirdViewControllerDelegate {


//func setDataInfoRocket (measurementValuesInfoRocket: [[String : String]])
//{
//    let formatter = NumberFormatter()
//    formatter.numberStyle = .decimal
//
//    measurementValuesInfoRocket.enumerated().forEach { index, measurementValues in
//        infoRocket[index]["unit"] = measurementValues["unit"]
//
//        switch measurementValues["name"] {
//
//        case "Высота":
//            measurementValues["unit"] == "ft"
//            ? infoRocket[index]["value"] = formatter.string(for: rockets?[rocket].height?.feet ?? 0)
//            : (infoRocket[index]["value"] = formatter.string(for: rockets?[rocket].height?.meters ?? 0))
//
//        case "Диаметр":
//            measurementValues["unit"] == "ft"
//            ? infoRocket[index]["value"] = formatter.string(for: rockets?[rocket].diameter?.feet ?? 0)
//            : (infoRocket[index]["value"] = formatter.string(for: rockets?[rocket].diameter?.meters ?? 0))
//
//        case "Масса":
//            measurementValues["unit"] == "lb"
//            ? infoRocket[index]["value"] = formatter.string(for: rockets?[rocket].mass?.lb ?? 0)
//            : (infoRocket[index]["value"] = formatter.string(for: rockets?[rocket].mass?.kg ?? 0))
//
//        case "Нагрузка":
//            measurementValues["unit"] == "lb"
//            ? infoRocket[index]["value"] = formatter.string(for: rockets?[rocket].payload_weights.first??.lb ?? 0)
//            : (infoRocket[index]["value"] = formatter.string(for: rockets?[rocket].payload_weights.last??.kg ?? 0))
//
//
//        case .none: break
//
//        case .some(_): break
//        }
//    }
//
//    infoCollectionView.reloadData()
//}
