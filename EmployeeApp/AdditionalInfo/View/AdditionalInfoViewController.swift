//
//  AdditionalInfoViewController.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/10.
//

import UIKit
import SkyFloatingLabelTextField

class AdditionalInfoViewController: UIViewController {
    
    @IBOutlet weak var chooseGenderLabel: UILabel!
    @IBOutlet weak var genderSegmentView: UISegmentedControl!
    @IBOutlet weak var selectPreferredColorLabel: UILabel!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var chooseColorButton: UIButton!
    @IBOutlet weak var residentialAddressTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var containerView: UIView!
    
    private var selectedColor: Color?
    private var employeeDetailsDTO: EmployeesDatailsDTO
    private var isResidentialAddressValid: Bool = false
    private var residentialAddress: String = ""
    
    private let genders = ["Male", "Female", "Other"]
    private var selectedGenderIndex: Int = 0
    
    init(dto: EmployeesDatailsDTO) {
        self.employeeDetailsDTO = dto
        super.init(nibName: String(describing: AdditionalInfoViewController.self), bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureView()
    }
    
    func configureNavigationBar() {
        title = .localized(.additionalInfoScreenTitle)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let rightBarButton = UIBarButtonItem(title: .localized(.commonNextButtonTitle), style: .plain, target: self, action: #selector(nextButtonTapped))
        rightBarButton.tintColor = .black
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    func configureView() {
        colorView.layer.cornerRadius = colorView.frame.width / 2
        colorView.layer.borderWidth = 0.5
        chooseColorButton.layer.borderWidth = 0.5
        colorView.layer.borderColor = UIColor.lightGray.cgColor
        chooseColorButton.layer.borderColor = UIColor.black.cgColor
        
        containerView.addTopBorder()
        containerView.addBottomBorder()
        
        residentialAddressTextField.delegate = self
        residentialAddressTextField.addTarget(self, action: #selector(validateResidentialAddress), for: .editingChanged)
    }
    
    @objc func validateResidentialAddress() {
        guard let residentialAddress = residentialAddressTextField.text, !residentialAddress.isEmpty else {
            residentialAddressTextField.errorMessage = .localized(.enterValidResidentialAddress)
            isResidentialAddressValid = false
            return
        }

        if residentialAddress.count < 5 {
            residentialAddressTextField.errorMessage = .localized(.enterValidResidentialAddress)
            isResidentialAddressValid = false
        } else {
            residentialAddressTextField.errorMessage = ""
            self.residentialAddress = residentialAddress
            isResidentialAddressValid = true
        }
    }
    
    @IBAction func nextButtonTapped() {
        validateResidentialAddress()
        if isAdditionalInfoValid() {
            let reviewViewController = ReviewDetailsViewController(dto: employeeDetailsDTO)
            self.navigationController?.pushViewController(reviewViewController, animated: true)
        }
    }
    
    private func isAdditionalInfoValid() -> Bool {
        guard let selectedColor = selectedColor else {
            self.selectPreferredColorLabel.textColor = .systemRed
            return false
        }
        
        if isResidentialAddressValid {
            employeeDetailsDTO.preferredColor = selectedColor
            employeeDetailsDTO.gender = genders[selectedGenderIndex]
            employeeDetailsDTO.residentionAddress = residentialAddress
            return true
        }else{
            return false
        }
    }
    
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        selectedGenderIndex = sender.selectedSegmentIndex
    }
    
    @IBAction func chooseColorButtonTapped(_ sender: Any) {
        let chooseColorViewController = SelectPreferredColorViewController(selectedColor: selectedColor) { [weak self] color in
            guard let self = self else { return }
            self.selectedColor = color
            self.updateViewWith(selectedColor: color)
        }
        self.navigationController?.pushViewController(chooseColorViewController, animated: true)
    }
    
    private func updateViewWith(selectedColor: Color) {
        let preferredColor = selectedColor.color.asUIColor()
        self.colorView.backgroundColor = preferredColor
        self.colorLabel.textColor = preferredColor
        self.colorLabel.text = selectedColor.name
        self.selectPreferredColorLabel.textColor = .black
    }
    

}

// MARK: - UITextFieldDelegate
extension AdditionalInfoViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
