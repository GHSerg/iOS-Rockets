//
//  MainViewModel.swift
//  Rocket-iOS
//
//  Created by Sergey Bodnar on 09.04.2022.
//

import Foundation
import UIKit

struct ImageRocket {
    var imageRocket: UIImage?
}

struct NameSettingRocket {
    var name: String?
}

struct InfoRocket {
    var nameValue: String?
    var value: String?
}

struct InfoRocketCollection {
    var infoRocketCollection: [InfoRocket] = []
}

struct DescriptionRocket {
    var nameDescription: String?
    var valueDescription: String?
}

struct DescriptionRocketTable {
    var descriptionRocketTable: [DescriptionRocket] = []
}
