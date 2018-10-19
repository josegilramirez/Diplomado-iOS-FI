//
//  CountryService.swift
//  WorldDB-Sha1Cache
//
//  Created by José Gil Ramírez S on 06/10/18.
//  Copyright © 2018 José Gil Ramírez S. All rights reserved.
//

import Foundation

class CountryService {
    static let shared = CountryService()
    
    let client = Client(baseURLComponents: URLComponents(string: "https://worldb.herokuapp.com")!)
    
    func getAllCountries(completion: @escaping ([Country]) -> Void) {
        client.get(path: "/api/countries") { data in
            guard let data = data else { return }
            
            print("tamaño de datos: \(data)")
            let sha1Swift = Digests.sha1(string: String(decoding: data, as: UTF8.self))
            print("sha1Swift - \(sha1Swift)")
            let sha1Objc = CDDigests.sha1NSData(data)
            print("sha1Objc - \(sha1Objc!)")
    
            if let result = try? JSONDecoder().decode([Country].self, from: data) {
                print("Guardando archivo en disco")
                CodableStorage<[Country]>.permanent(filename: sha1Objc! + ".json").save(data: result)
                DispatchQueue.main.async { completion(result) }
            }
        }
    }
}
