//
//  InformationCollectionViewCell.swift
//  Rocket-iOS
//
//  Created by Sergey Bodnar on 05.04.2022.
//

import UIKit

class InformationCollectionViewCell: UITableViewCell {

    //@IBOutlet weak var infoTableVewCell: UILabel!
    
    @IBOutlet weak var infoTableViewCell: UILabel!
    func configure(textCell: String ){

       infoTableViewCell.text = textCell
    }
    

}
