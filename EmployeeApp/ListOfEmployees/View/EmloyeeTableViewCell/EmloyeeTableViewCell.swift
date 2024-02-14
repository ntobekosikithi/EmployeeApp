//
//  EmloyeeTableViewCell.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/10.
//

import UIKit

class EmloyeeTableViewCell: UITableViewCell, NibView, ReusableView {

    @IBOutlet weak var fullNamesLabel: UILabel!
    @IBOutlet weak var emailAddressLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    private let imageDownloader = ImageDownloader()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImageView.layer.borderColor = UIColor.black.cgColor
        avatarImageView.layer.borderWidth = 0.5
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width/2
    }
    
    func configure(employee: Employee, selectedId: Int?) {
        fullNamesLabel.text = employee.fullName()
        emailAddressLabel.text = employee.email
        displayAvatar(url: employee.avatar)
        
        if let selectedId = selectedId {
            self.accessoryType = selectedId == employee.id ? .checkmark : .none
        }
    }
    
    func displayAvatar(url: String) {
        Task {
            do {
                guard let imageUrl = URL(string: url) else { return }
                let image = try await imageDownloader.downloadImage(from: imageUrl)
                avatarImageView.image = image
            } catch {
                avatarImageView.image = UIImage(systemName: "photo")
            }
        }
    }
}
