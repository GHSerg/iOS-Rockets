//
//  LaunchesTableViewCell.swift
//  Rocket-iOS
//
//  Created by Sergey Bodnar on 16.04.2022.
//

import UIKit

class LaunchesTableViewCell: UITableViewCell {

    @IBOutlet weak var cellInfoRocket: UIView!
    
    @IBOutlet weak var nameRocketLabel: UILabel!
    @IBOutlet weak var dateRocketLabel: UILabel!
    @IBOutlet weak var imageRocketImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        setupLayout()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupLayout() {
        cellInfoRocket.layer.cornerRadius = 24
    }
    
    func configure (name: String, date: String, image: String) {
        nameRocketLabel.text = name
        dateRocketLabel.text = date
        imageRocketImage.image = UIImage(named: image)
    }
}
