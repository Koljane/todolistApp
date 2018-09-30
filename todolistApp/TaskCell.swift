//
//  TaskCell.swift
//  todolistApp
//
//  Created by Konstantin Nenadov on 9/29/18.
//  Copyright © 2018 com.Konstantin Nenadov. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBAction func checkBoxAction(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
        
    }
    
    @IBOutlet weak var taskNameLabel: UILabel!
    
}
