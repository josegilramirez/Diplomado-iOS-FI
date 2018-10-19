//
//  Digests.swift
//  CommonCryptoDigest
//
//  Created by José Gil Ramírez S on 06/10/18.
//  Copyright © 2018 José Gil Ramírez S. All rights reserved.
//

import Foundation

class Digests {
    func sha1(string: String) -> String {
        let data = string.data(using: String.Encoding.utf8)!
        return sha1(data: data)
    }
    
    func sha1(data: Data) -> String {
        return sha1(data: data).map { String(format: "%02hhx", $0) }.joined()
    }
    
    func sha1(data: Data) -> [UInt8] {
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
        data.withUnsafeBytes {
            _ = CC_SHA1($0, CC_LONG(data.count), &digest)
        }
        return digest
    }
}
