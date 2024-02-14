//
//  ListOfEmployeesView.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/10.
//

import Foundation

protocol ListOfEmployeesView: AnyObject {
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func displayEmployees(employees: EmployeesDatailsResponse)
    func displayEmptyView()
    func displayErrorMessage(message: String)
}
