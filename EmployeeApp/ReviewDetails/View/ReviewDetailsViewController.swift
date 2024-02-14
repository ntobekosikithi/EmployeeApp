//
//  ReviewDetailsViewController.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/11.
//

import UIKit

class ReviewDetailsViewController: UIViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var emailAddressLabel: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var colorNameLabel: UILabel!
    @IBOutlet weak var placeOfBirthLabel: UILabel!
    @IBOutlet weak var residentialAddressLabel: UILabel!
    @IBOutlet weak var personalDetailsView: UIView!
    @IBOutlet weak var additionalInfoView: UIView!
    
    private let imageDownloader = ImageDownloader()
    private var employeeDetailsDTO: EmployeesDatailsDTO!
    private lazy var viewModel: ReviewDetailsViewModel = {
        return ReviewDetailsViewModel(view: self)
    }()
    
    init(dto: EmployeesDatailsDTO) {
        self.employeeDetailsDTO = dto
        super.init(nibName: String(describing: ReviewDetailsViewController.self), bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        title = .localized(.reviewScreenTitle)
        setViewBorders()
        fullNameLabel.text = employeeDetailsDTO.employee?.fullName()
        emailAddressLabel.text = employeeDetailsDTO.employee?.email
        dateOfBirthLabel.text = employeeDetailsDTO.dateOfBirth
        genderLabel.text = employeeDetailsDTO.gender
        colorNameLabel.text = employeeDetailsDTO.preferredColor?.name
        placeOfBirthLabel.text = employeeDetailsDTO.placeOfBirth
        residentialAddressLabel.text = employeeDetailsDTO.residentionAddress
        
        Task {
            do {
                guard let imageUrl = URL(string: employeeDetailsDTO.employee?.avatar ?? "") else { return }
                let image = try await imageDownloader.downloadImage(from: imageUrl)
                avatarImageView.image = image
            } catch {
                avatarImageView.image = UIImage(systemName: "photo")
            }
        }
    }
    
    func setViewBorders() {
        personalDetailsView.addTopBorder()
        personalDetailsView.addBottomBorder()
        additionalInfoView.addBottomBorder()
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
        avatarImageView.layer.borderWidth = 0.5
        avatarImageView.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        viewModel.updateEmployeeDetails(dto: employeeDetailsDTO)
    }

}

// MARK: - ReviewDetailsView delegate functions
extension ReviewDetailsViewController: ReviewDetailsView {
    func showLoadingIndicator() {
        showActivityIndicatory()
    }
    
    func hideLoadingIndicator() {
        hideActivityIndicatory()
    }
    
    func displaySuccessScreen() {
        let successViewController = CustomMessageDiplayViewController(self,
                                                                      customViewType: .success,
                                                                      titleMessage: .localized(.commonSuccessfulViewTitle),
                                                                      descriptionMessage: .localized(.updateEmployeeSuccessfulViewDescription))
        successViewController.modalPresentationStyle = .fullScreen
        self.present(successViewController, animated: true)
    }
    
    func displayErrorMessage(message: String) {
        ErrorDisplayHelper.showError(message: message)
    }
}

// MARK: - CustomMessageDiplayDelegate delegate function
extension ReviewDetailsViewController: CustomMessageDiplayDelegate {
    func CustomButtonTapped() {
        navigationController?.popToViewController(ofClass: EmployeeDetailsViewController.self)
    }
}
    
