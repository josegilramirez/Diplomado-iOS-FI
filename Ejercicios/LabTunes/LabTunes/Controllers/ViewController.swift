//
//  ViewController.swift
//  LabTunes
//
//  Created by José Gil Ramírez S on 11/9/18.
//  Copyright © 2018 José Gil Ramírez S. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        guard let userName = userNameTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        if User.login(userName: userName, password: password) {
            performSegue(withIdentifier: "LoginSuccess", sender: self)
        }
    }
}

