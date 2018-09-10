//
//  IntermediaryModels.swift
//  Restaurant
//
//  Created by José Gil Ramírez S on 06/09/18.
//  Copyright © 2018 José Gil Ramírez S. All rights reserved.
//

import Foundation

struct Categories: Codable {
    let categories: [String]
}

struct PreparationTime: Codable {
    let preparationTime: Int
    enum CodingKeys: String, CodingKey {
        case preparationTime = "preparation_time"
    }
}


protocol AddToOrderDelegate {
    func added(menuItem: MenuItem)
}
