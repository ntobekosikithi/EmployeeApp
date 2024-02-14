//
//  EmployeeDetailsViewController.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/10.
//

import UIKit
import SkyFloatingLabelTextField

class EmployeeDetailsViewController: UIViewController {
    
    @IBOutlet weak var selectAnEmployeeLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var fullNamesLabel: UILabel!
    @IBOutlet weak var emailAddressLabel: UILabel!
    @IBOutlet weak var selectEmployeeButton: UIButton!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var dateOfBirthPicker: UIDatePicker!
    @IBOutlet weak var placeOfBirthTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var containerView: UIView!
    
    private var employeeDetailsDTO: EmployeesDatailsDTO!
    private var selectedEmployee: Employee?
    private let imageDownloader = ImageDownloader()
    private var isPlaceOfBirthValid: Bool = false
    private var placeOfBirth: String = ""
    private var selectedDateOfBirth: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureView()
    }
    
    func configureNavigationBar() {
        title = .localized(.employeeDetailsScreenTitle)
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let rightBarButton = UIBarButtonItem(title: .localized(.commonNextButtonTitle), style: .plain, target: self, action: #selector(nextButtonTapped))
        rightBarButton.tintColor = .black
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    func configureView() {
        setUpBorderForViews()

        dateOfBirthPicker.datePickerMode = .date
        dateOfBirthPicker.maximumDate = maximumDate()
        dateOfBirthPicker.addTarget(self, action: #selector(dateOfBirthChanged), for: .valueChanged)


        placeOfBirthTextField.delegate = self
        placeOfBirthTextField.addTarget(self, action: #selector(validatePlaceOfBirthTextField), for: .editingChanged)
    }
    
    func setUpBorderForViews() {
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
        avatarImageView.layer.borderWidth = 0.5
        selectEmployeeButton.layer.borderWidth = 0.5
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        selectEmployeeButton.layer.borderColor = UIColor.white.cgColor
    }
    
    @objc private func dateOfBirthChanged() {
        let selectedDate = dateOfBirthPicker.date
        selectedDateOfBirth = selectedDate.formatterDateString()
        dateOfBirthLabel.textColor = .black
    }
    
    @objc func validatePlaceOfBirthTextField() {
        guard let enterePlaceOfBirth = placeOfBirthTextField.text, !enterePlaceOfBirth.isEmpty else {
            placeOfBirthTextField.errorMessage = .localized(.placeOfBirthRequired)
            isPlaceOfBirthValid = false
            return
        }

        if enterePlaceOfBirth.count < 3 {
            placeOfBirthTextField.errorMessage = .localized(.placeOfBirthRequired)
            isPlaceOfBirthValid = false
        } else {
            placeOfBirthTextField.errorMessage = ""
            placeOfBirth = enterePlaceOfBirth
            isPlaceOfBirthValid = true
        }
    }
    
    private func setInputFieldState(text: String, errorMessage: String, isValid: Bool) {
        placeOfBirthTextField.errorMessage = errorMessage
        placeOfBirth = text
        isPlaceOfBirthValid = isValid
    }

    @IBAction func nextButtonTapped() {
        validatePlaceOfBirthTextField()
        guard let selectedEmployee = selectedEmployee else {
            selectAnEmployeeLabel.textColor = .systemRed
            return
        }
        
        if selectedDateOfBirth.isEmpty {
            dateOfBirthLabel.textColor = .systemRed
            return
        }
        
        if isPlaceOfBirthValid {
            let dto = EmployeesDatailsDTO(employee: selectedEmployee,
                                          dateOfBirth: selectedDateOfBirth,
                                          placeOfBirth: placeOfBirth)
            let additionalInfoViewController = AdditionalInfoViewController(dto: dto)
            self.navigationController?.pushViewController(additionalInfoViewController, animated: true)
        }
    }
    
    @IBAction func selectEmployeeButtonTapped(_ sender: Any) {
        let ListOfEmployeesViewController = ListOfEmployeesViewController(selectedEmployee: self.selectedEmployee) { [weak self] employee in
            guard let self = self else { return }
            self.selectedEmployee = employee
            self.setSelectedEmployeDetails(employee: employee)
        }
        self.navigationController?.pushViewController(ListOfEmployeesViewController, animated: true)
    }
    
    private func setSelectedEmployeDetails(employee: Employee) {
        fullNamesLabel.text = employee.fullName()
        emailAddressLabel.text = employee.email
        selectAnEmployeeLabel.textColor = .black
        
        Task {
            do {
                guard let imageUrl = URL(string: employee.avatar) else { return }
                let image = try await imageDownloader.downloadImage(from: imageUrl)
                avatarImageView.image = image
            } catch {
                avatarImageView.image = UIImage(systemName: "photo")
            }
        }
    }
    
    private func maximumDate() -> Date {
        let calendar = Calendar.current
        let currentDate = Date()

        if let maxDate = calendar.date(byAdding: .year, value: -18, to: currentDate) {
            return maxDate
        }
        return currentDate
    }
}

// MARK: - UITextFieldDelegate
extension EmployeeDetailsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
