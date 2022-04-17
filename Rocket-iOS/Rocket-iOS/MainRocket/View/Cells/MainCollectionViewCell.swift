import UIKit

class MainCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var infoValueCellLabel: UILabel!
    @IBOutlet weak var infoValueNameCellLabel: UILabel!

    func configure(nameCell: String, unitCell: String, valueCell: String ) {

        infoValueNameCellLabel.text = nameCell + ", " + unitCell
        infoValueCellLabel.text = valueCell
    }
}
