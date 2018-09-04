//
//  ToDoCell.swift
//  ToDoList
//
//  Created by José Gil Ramírez S on 03/09/18.
//  Copyright © 2018 José Gil Ramírez S. All rights reserved.
//

import UIKit
@objc protocol ToDoCellDelegate: class {
    func checkmarkTapped(sender: ToDoCell)
}

class ToDoCell: UITableViewCell {
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBAction func completeButtonTapped() {
        delegate?.checkmarkTapped(sender: self)
    }
    
    var delegate: ToDoCellDelegate?
    
}
