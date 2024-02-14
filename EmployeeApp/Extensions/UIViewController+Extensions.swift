//
//  UIViewController+Extensions.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/10.
//

import Foundation
import UIKit

extension UIViewController {
    func showActivityIndicatory(color: UIColor = .black) {
        let actInd: UIActivityIndicatorView = UIActivityIndicatorView()
        actInd.frame = CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0)
        actInd.center = self.view.center
        actInd.hidesWhenStopped = true
        actInd.style =
            UIActivityIndicatorView.Style.large
        actInd.color = color
        actInd.tag = 111
        self.view.addSubview(actInd)
        actInd.startAnimating()
        self.view.isUserInteractionEnabled = false
    }
    
    func hideActivityIndicatory() {
        if let actInd = self.view.viewWithTag(111) {
            actInd.removeFromSuperview()
        }
        self.view.isUserInteractionEnabled = true
    }
}
