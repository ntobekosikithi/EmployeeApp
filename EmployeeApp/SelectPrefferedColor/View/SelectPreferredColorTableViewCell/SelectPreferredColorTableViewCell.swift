//
//  SelectPreferredColorTableViewCell.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/10.
//

import UIKit

class SelectPreferredColorTableViewCell: UITableViewCell, NibView, ReusableView {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var colorNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        colorView.layer.borderColor = UIColor.gray.cgColor
        colorView.layer.borderWidth = 0.5
        colorView.layer.cornerRadius = colorView.frame.size.width/2
    }
    
    func configure(color: Color, selectedId: Int?) {
        colorNameLabel.text = color.name
        colorNameLabel.textColor = color.color.asUIColor()
        colorView.backgroundColor = color.color.asUIColor()
        
        if let selectedId = selectedId {
            self.accessoryType = selectedId == color.id ? .checkmark : .none
        }
    }
}
