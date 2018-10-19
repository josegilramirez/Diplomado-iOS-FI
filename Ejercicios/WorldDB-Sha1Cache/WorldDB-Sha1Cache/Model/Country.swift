//
//  Country.swift
//  WorldDB-Sha1Cache
//
//  Created by José Gil Ramírez S on 06/10/18.
//  Copyright © 2018 José Gil Ramírez S. All rights reserved.
//

import UIKit

struct Country: Codable {
    let id: Int
    let name: String
    let iso: String
    let languages: [String]
    private var flagFilename: String {
        return "flag-\(self.iso).png"
    }
    
    func flag() -> URL {
        return  URL(string: "https://www.countryflags.io/\(iso)/flat/64.png")!
    }
    
}
