//
//  ReviewDetailsViewModel.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/11.
//

import Foundation

class ReviewDetailsViewModel {
    @Inject private var repository: EmployeeRepository
    private weak var view: ReviewDetailsView?

    init(view: ReviewDetailsView) {
        self.view = view
    }
    
    func updateEmployeeDetails(dto: EmployeesDatailsDTO) {
        self.view?.showLoadingIndicator()
        AsyncProvider.runOnConcurrent { [weak self] in
            guard let self = self else { return }
            self.repository.updateEmployeeDetails(dto: dto) { results in
                AsyncProvider.runOnMain { [weak self] in
                    guard let self = self else { return }
                    self.view?.hideLoadingIndicator()
                    switch results {
                    case .success(_):
                        self.view?.displaySuccessScreen()
                    case .failure(let error):
                        self.view?.displayErrorMessage(message: error.localizedDescription)
                    }
                }
            }
        }
    }

}
