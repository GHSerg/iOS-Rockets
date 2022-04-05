//
//  DescriptionTableViewCell.swift
//  Rocket-iOS
//
//  Created by Sergey Bodnar on 03.04.2022.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {

  


    @IBOutlet weak var nameDescriptionTableViewCellLabel: UILabel!
    
    
    func configure(textCell: String ){

        nameDescriptionTableViewCellLabel.text = textCell
    }
    
}
