//
//  SelectPreferredColorViewModel.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/10.
//

import Foundation

class SelectPreferredColorViewModel {
    
    @Inject private var repository: EmployeeRepository
    private weak var view: SelectPreferredColorView?
    
    init(view: SelectPreferredColorView) {
        self.view = view
    }
    
    func getPreferredColors(perPage: String) {
        self.view?.showLoadingIndicator()
        AsyncProvider.runOnConcurrent { [weak self] in
            guard let self = self else { return }
            self.repository.gePreferredColors(perPage: perPage) { results in
                AsyncProvider.runOnMain { [weak self] in
                    guard let self = self else { return }
                    self.view?.hideLoadingIndicator()
                    switch results {
                    case .success(let colors):
                        colors.colors.count < 1 ? self.view?.displayEmptyView() : self.view?.displayColors(colors: colors)
                    case .failure(let error):
                        self.view?.displayErrorMessage(message: error.localizedDescription)
                    }
                }
            }
        }
    }

}
