//
//  SecondViewController.swift
//  iTunesTable
//
//  Created by José Gil Ramírez S on 01/09/18.
//  Copyright © 2018 José Gil Ramírez S. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var etiqueta: UILabel!
    var fromFirstView: String = ""
    @IBOutlet weak var albumImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        etiqueta.text = fromFirstView
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
