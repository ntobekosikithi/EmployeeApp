//
//  LoginViewModel.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/10.
//

import Foundation

class LoginViewModel {
    @Inject private var repository: EmployeeRepository
    private weak var view: LoginView?
    
    init(view: LoginView) {
        self.view = view
    }
    
    func authenticateUser(email: String, password: String) {
        self.view?.showLoadingIndicator()
        AsyncProvider.runOnConcurrent { [weak self] in
            guard let self = self else { return }
            self.repository.login(with: email, password: password) { results in
                AsyncProvider.runOnMain { [weak self] in
                    guard let self = self else { return }
                    self.view?.hideLoadingIndicator()
                    switch results {
                    case .success(let userDetails):
                        userDetails.token.isEmpty ? self.view?.displayErrorMessage(message: ServiceError.unauthorized.localizedDescription) : self.storeToken(token: userDetails.token)
                        
                    case .failure(let error):
                        self.view?.displayErrorMessage(message: error.localizedDescription)
                    }
                }
            }
        }
    }
    
    private func storeToken(token: String) {
        let status = AuthenticationManager.shared.saveToken(accessToken: token)
        status == errSecSuccess ? self.view?.navigateToEmployeeDetails() : self.view?.displayErrorMessage(message: .localized(.failedToSaveToken))
    }
    
    func isEmailValid(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}
