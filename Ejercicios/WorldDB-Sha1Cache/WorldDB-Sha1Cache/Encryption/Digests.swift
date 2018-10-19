//
//  Digests.swift
//  WorldDB-Sha1Cache
//
//  Created by José Gil Ramírez S on 07/10/18.
//  Copyright © 2018 José Gil Ramírez S. All rights reserved.
//

import Foundation
import UIKit

class Digests {
    class func sha1(string: String) -> String {
        let data = string.data(using: .utf8)!
        return data.sha1()
    }
    
    class func sha256(string: String) -> String {
        let data = string.data(using: String.Encoding.utf8)!
        return data.sha256()
    }
    
    class func sha256(data: Data) -> Data? {
        var hashData = Data(count: Int(CC_SHA256_DIGEST_LENGTH))
        _ = hashData.withUnsafeMutableBytes {digestBytes in
            data.withUnsafeBytes {messageBytes in
                CC_SHA256(messageBytes, CC_LONG(data.count), digestBytes)
            }
        }
        return hashData
    }
    
    class func base64(string: String) -> String {
        return String(data: Data(string.utf8).base64EncodedData(), encoding: .utf8) ?? ""
    }
    
    class func base64(image: UIImage) -> String {
        //return image.pngData()?.base64() ?? ""
        return UIImagePNGRepresentation(image)?.base64() ?? ""
    }
}
