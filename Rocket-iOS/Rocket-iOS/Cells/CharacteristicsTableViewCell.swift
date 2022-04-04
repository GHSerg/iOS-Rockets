//
//  CharacteristicsTableViewCell.swift
//  Rocket-iOS
//
//  Created by Sergey Bodnar on 03.04.2022.
//

import UIKit

class CharacteristicsTableViewCell: UITableViewCell {

  

    @IBOutlet weak var characteristicsTableViewCellLabel: UILabel!
    
    
    func configure(textCell: Int ){

        characteristicsTableViewCellLabel.text = "\(textCell)"
    }
    
}
