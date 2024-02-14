//
//  ListOfEmployeesViewModel.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/10.
//

import Foundation

class ListOfEmployeesViewModel {
    @Inject private var repository: EmployeeRepository
    private weak var view: ListOfEmployeesView?
    
    init(view: ListOfEmployeesView) {
        self.view = view
    }
    
    func getEmployees(page: String, perPage: String) {
        self.view?.showLoadingIndicator()
        AsyncProvider.runOnConcurrent { [weak self] in
            guard let self = self else { return }
            self.repository.getListOfEmployees(page: page, perPage: perPage) { results in
                AsyncProvider.runOnMain { [weak self] in
                    guard let self = self else { return }
                    self.view?.hideLoadingIndicator()
                    switch results {
                    case .success(let employees):
                        employees.employees.count < 1 ? self.view?.displayEmptyView() : self.view?.displayEmployees(employees: employees)
                    case .failure(let error):
                        self.view?.displayErrorMessage(message: error.localizedDescription)
                    }
                }
            }
        }
    }

}
