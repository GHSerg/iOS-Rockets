//
//  InfoRocketCollectionViewCell.swift
//  Rocket-iOS
//
//  Created by Sergey Bodnar on 05.04.2022.
//

import UIKit

class InfoRocketCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var infoValueCellLabel: UILabel!
    @IBOutlet weak var infoValueNameCellLabel: UILabel!

    func configure(nameCell: String, unitCell: String, valueCell: String ) {

        infoValueNameCellLabel.text = nameCell + ", " + unitCell
        infoValueCellLabel.text = valueCell
    }
}
