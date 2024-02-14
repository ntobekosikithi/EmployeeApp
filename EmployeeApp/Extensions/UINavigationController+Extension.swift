//
//  UINavigationController+Extension.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/11.
//

import Foundation
import UIKit

extension UINavigationController {
  func popToViewController(ofClass: AnyClass, animated: Bool = true) {
    if let vc = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
      popToViewController(vc, animated: animated)
    }
  }
}
