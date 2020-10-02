//
//  ListTableViewCell.swift
//  ToDoList
//
//  Created by Alex Golden on 10/1/20.
//

import UIKit
protocol ListTableViewCellDelegate: class {
    func checkBoxToggle(sender: ListTableViewCell)
    
    
}
class ListTableViewCell: UITableViewCell {
    
    weak var delegate: ListTableViewCellDelegate?

    @IBOutlet weak var checkBoxButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBAction func checkToggled( sender: UIButton!){
        delegate?.checkBoxToggle(sender: self)
    }
}
