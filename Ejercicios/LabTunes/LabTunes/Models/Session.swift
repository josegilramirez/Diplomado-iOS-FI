//
//  Session.swift
//  LabTunes
//
//  Created by José Gil Ramírez S on 11/9/18.
//  Copyright © 2018 José Gil Ramírez S. All rights reserved.
//

import Foundation

class Session: NSObject {
    var token: String?
    
    //Con el patrón Singleton nos aseguraremos que solo exista una sesión. Con el static no necesitamos hacer una instancia. Al ser LET no es mutable y no puede cambiarse. Con el override private no se puede llamar al inicializador desde otra clase que no sea Session.
    static let sharedInstance = Session()
    
    override private init() {
        super.init()
    }
    
    func saveSession() {
        token = "1234567890"
    }
    
}
