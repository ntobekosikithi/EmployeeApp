//
//  SelectPreferredColorView.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/10.
//

import Foundation

protocol SelectPreferredColorView: AnyObject {
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func displayColors(colors: ColorsDetailsRepsonse)
    func displayErrorMessage(message: String)
    func displayEmptyView()
}
