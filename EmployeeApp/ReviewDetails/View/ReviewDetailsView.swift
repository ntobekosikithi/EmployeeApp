//
//  ReviewDetailsView.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/11.
//

import Foundation

protocol ReviewDetailsView: AnyObject {
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func displaySuccessScreen()
    func displayErrorMessage(message: String)
}
