//
//  Song.swift
//  LabTunes
//
//  Created by José Gil Ramírez S on 11/9/18.
//  Copyright © 2018 José Gil Ramírez S. All rights reserved.
//

import Foundation

struct Song {
    var artist: String
    var name: String
    
    static func create(dictionary: NSDictionary) -> Song? {
        guard let trackName = dictionary["trackName"] as? String else { return nil }
        guard let artist = dictionary["artistName"] as? String else { return nil }
        
        return Song(artist: artist, name: trackName)
    }
}
