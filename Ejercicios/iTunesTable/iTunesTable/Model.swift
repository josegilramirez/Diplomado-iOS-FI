//
//  Model.swift
//  iTunesTable
//
//  Created by José Gil Ramírez S on 01/09/18.
//  Copyright © 2018 José Gil Ramírez S. All rights reserved.
//

import Foundation

struct QueryResults: Codable {
    var resultCount: Int
    var results: [Tracks]
}

struct Tracks: Codable {
    var artistName: String
    var collectionName: String
    var trackName: String
    var artworkUrl100: String
}

extension URL {
    func withQueries(_ queries:[String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.flatMap { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}
