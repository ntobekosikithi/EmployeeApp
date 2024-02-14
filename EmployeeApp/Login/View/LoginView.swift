//
//  LoginView.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/10.
//

import Foundation

protocol LoginView: AnyObject {
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func displayErrorMessage(message: String)
    func navigateToEmployeeDetails()
}
