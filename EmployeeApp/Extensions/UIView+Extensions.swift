//
//  UIView+Extensions.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/10.
//

import Foundation
import UIKit

extension UIView {
    func addTopBorder() {
        let border = CALayer()
        border.backgroundColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: 0.5)
        self.layer.addSublayer(border)
    }

    func addBottomBorder() {
        let border = CALayer()
        border.backgroundColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - 1.0, width: self.frame.size.width, height: 0.5)
        self.layer.addSublayer(border)
    }
}
