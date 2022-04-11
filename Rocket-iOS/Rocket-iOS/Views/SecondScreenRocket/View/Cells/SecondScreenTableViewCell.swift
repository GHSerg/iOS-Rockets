//
//  SecondScreenTableViewCell.swift
//  Rocket-iOS
//
//  Created by Sergey Bodnar on 11.04.2022.
//

import UIKit

class SecondScreenTableViewCell: UITableViewCell {

    @IBOutlet weak var viewCell: UIView!
    
    @IBOutlet weak var nameRocket: UILabel!
    @IBOutlet weak var dateRocket: UILabel!
    @IBOutlet weak var imageRocket: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupLayout()
    }
    
    private func setupLayout() {
        viewCell.layer.cornerRadius = 24
        //nameSettingsRocketView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func configure (name: String, date: String) {
        nameRocket.text = name
        dateRocket.text = date
    }
}
