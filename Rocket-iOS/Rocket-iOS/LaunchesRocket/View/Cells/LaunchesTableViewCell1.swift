//
//  SecondScreenTableViewCell.swift
//  Rocket-iOS
//
//  Created by Sergey Bodnar on 11.04.2022.
//

import UIKit

class LaunchesTableViewCell1: UITableViewCell {

    @IBOutlet weak var cellInfoRocket: UIView!
    
    @IBOutlet weak var nameRocketLabel: UILabel!
    @IBOutlet weak var dateRocketLabel: UILabel!
    @IBOutlet weak var imageRocketImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupLayout()
    }
    
    private func setupLayout() {
        cellInfoRocket.layer.cornerRadius = 24
        //nameSettingsRocketView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
//    func configure (name: String, date: String, image: String) {
//        nameRocket.text = name
//        dateRocket.text = date
//        imageRocket.image = UIImage(named: image)
//    }
    
    func configure (name: String) {
        nameRocketLabel.text = name
    }
}
