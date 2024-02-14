//
//  LoginViewController.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/10.
//

import UIKit
import SkyFloatingLabelTextField

enum InputType {
    case email
    case password
    case dateOfBirth
    case placeOfBirth
}

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var loginButton: UIButton!
    
    private var isEmailAddressValid: Bool = false
    private var isPasswordValid: Bool = false
    private var emailAddress: String = ""
    private var password: String = ""
    private lazy var viewModel: LoginViewModel = {
        return LoginViewModel(view: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        loginButton.titleLabel?.text = .localized(.commonLoginButtonTitle)
        
        emailTextField.delegate = self
        emailTextField.addTarget(self, action: #selector(validateEmail), for: .editingChanged)

        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        passwordTextField.addTarget(self, action: #selector(validatePassword), for: .editingChanged)
    }
    
    @objc func validateEmail() {
        guard let email = emailTextField.text, !email.isEmpty else {
            setInputFieldState(type: .email,
                               errorMessage: .localized(.emailIsRequired),
                               isValid: false)
            return
        }

        if !viewModel.isEmailValid(email) {
            setInputFieldState(type: .email,
                               errorMessage: .localized(.enterValidEmailAddress),
                               isValid: false)
        } else {
            setInputFieldState(type: .email,
                               text: email,
                               errorMessage: "",
                               isValid: true)
        }
    }

    @objc func validatePassword() {
        guard let password = passwordTextField.text, !password.isEmpty else {
            setInputFieldState(type: .password,
                               errorMessage: .localized(.passwordIsRequired),
                               isValid: false)
            return
        }

        if password.count < 5 {
            setInputFieldState(type: .password,
                               errorMessage: .localized(.passwordIsTooShort),
                               isValid: false)
        } else {
            setInputFieldState(type: .password,
                               text: password,
                               errorMessage: "",
                               isValid: true)
        }
    }
    
    private func setInputFieldState(type:InputType, text: String = "", errorMessage: String, isValid: Bool) {
        if type == .email {
            emailTextField.errorMessage = errorMessage
            emailAddress = text
            isEmailAddressValid = isValid
        }else{
            passwordTextField.errorMessage = errorMessage
            password = text
            isPasswordValid = isValid
        }
    }

    
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        validateEmail()
        validatePassword()
        if isEmailAddressValid && isPasswordValid {
            viewModel.authenticateUser(email: emailAddress, password: password)
        }
    }
}

// MARK: - LoginView delegate
extension LoginViewController: LoginView {
    func showLoadingIndicator() {
        showActivityIndicatory(color: .white)
    }
    
    func hideLoadingIndicator() {
        hideActivityIndicatory()
    }
    
    func displayErrorMessage(message: String) {
        ErrorDisplayHelper.showError(message: message)
    }
    
    func navigateToEmployeeDetails() {
        self.navigationController?.pushViewController(EmployeeDetailsViewController(), animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
