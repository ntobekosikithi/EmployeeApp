//
//  CustomMessageDiplayViewController.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/11.
//

import UIKit

enum CustomViewType {
    case success
    case failure
    case warning
}

protocol CustomMessageDiplayDelegate: AnyObject {
    func CustomButtonTapped()
}

class CustomMessageDiplayViewController: UIViewController {

    @IBOutlet weak var customImageView: UIImageView!
    @IBOutlet weak var customTitleLabel: UILabel!
    @IBOutlet weak var customDescriptionLabel: UILabel!
    @IBOutlet weak var customActionButton: UIButton!
    
    
    private weak var delegate: CustomMessageDiplayDelegate?
    private var customViewType: CustomViewType = .success
    private var titleMessage: String
    private var descriptionMessage: String
    private var buttonTitle: String
    
    init(_ delegate: CustomMessageDiplayDelegate,
         customViewType: CustomViewType,
         titleMessage: String,
         descriptionMessage: String = "",
         buttonTitle: String = .localized(.commonDoneButtonTitle)) {
        
        self.delegate = delegate
        self.customViewType = customViewType
        self.titleMessage = titleMessage
        self.descriptionMessage = descriptionMessage
        self.buttonTitle = buttonTitle
        super.init(nibName: String(describing: CustomMessageDiplayViewController.self), bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setUpViewWithValues()
    }
    
    
    func configureView() {
        customImageView.layer.cornerRadius = customImageView.frame.width / 2
        customImageView.layer.borderWidth = 2
        customImageView.layer.borderColor = UIColor.black.cgColor
    }
    
    func setUpViewWithValues() {
        customTitleLabel.text = titleMessage
        customDescriptionLabel.text = descriptionMessage
        customActionButton.titleLabel?.text = buttonTitle

        switch customViewType {
        case .success:
            if let image = UIImage(named: "successIcon") {
                customImageView.image = image.withRenderingMode(.alwaysTemplate)
                customImageView.tintColor = .systemGreen
                customImageView.layer.borderColor = UIColor.systemGreen.cgColor
            }
        case .failure:
            if let image = UIImage(named: "errorIcon") {
                customImageView.image = image.withRenderingMode(.alwaysTemplate)
                customImageView.tintColor = .systemRed
                customImageView.layer.borderColor = UIColor.systemRed.cgColor
            }
        case .warning:
            if let image = UIImage(named: "errorIcon") {
                customImageView.image = image.withRenderingMode(.alwaysTemplate)
                customImageView.tintColor = .systemOrange
                customImageView.layer.borderColor = UIColor.systemOrange.cgColor
            }
        }
    }
    
    @IBAction func CustomActionButtonTapped(_ sender: Any) {
        delegate?.CustomButtonTapped()
        dismiss(animated: true)
    }
}
