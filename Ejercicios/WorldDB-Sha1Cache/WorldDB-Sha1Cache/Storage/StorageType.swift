//
//  StorageType.swift
//  WorldDB-Sha1Cache
//
//  Created by José Gil Ramírez S on 06/10/18.
//  Copyright © 2018 José Gil Ramírez S. All rights reserved.
//

import Foundation

enum StorageType {
    case cache
    case permanent
    
    var searchPathDirectory: FileManager.SearchPathDirectory {
        switch self {
        case .cache: return .cachesDirectory
        case .permanent: return .documentDirectory
        }
    }
    
    var folder: URL {
        var url = FileManager.default.urls(for: searchPathDirectory, in: .userDomainMask).first!
        let subfolder = "com.gilito.worldb.storage"
        url.appendPathComponent(subfolder)
        return url
    }
    
    func clearStorage() {
        try? FileManager.default.removeItem(at: folder)
    }
    
    func ensureExists() {
        print("Validando la existencia de \(self)")
        let fileManager = FileManager.default
        var isDir: ObjCBool = false
        if fileManager.fileExists(atPath: folder.path, isDirectory: &isDir) {
            print("Si existe \(self) en \(folder.path)")
            if isDir.boolValue { return }
            try? fileManager.removeItem(at: folder)
        }
        print("No existe \(self) en \(folder.path)")
        try? fileManager.createDirectory(at: folder, withIntermediateDirectories: false, attributes: nil)
    }
}
