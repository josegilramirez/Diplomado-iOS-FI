//
//  ViewController.swift
//  WaterControl
//
//  Created by José Gil Ramírez S on 13/10/18.
//  Copyright © 2018 José Gil Ramírez S. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var counterView: CounterView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func addCounter(_ sender: ActionButton) {
        counterView.counter = counterView.counter + 1
    }
    
    @IBAction func substractCounter(_ sender: ActionButton) {
        counterView.counter = counterView.counter - 1
    }
}

