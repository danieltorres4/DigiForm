//
//  UserInfoTableViewCell.swift
//  DigiForm
//
//  Created by Daniel ST on 18/01/24.
//

import UIKit

class UserInfoTableViewCell: UITableViewCell {
    private let fullNameLabel: UILabel = {
        let textField = UILabel()
        textField.font = UIFont(name: "Rockwell", size: 18)
        textField.textColor = UIColor(red: 28/255.0, green: 103/255.0, blue: 41/255.0, alpha: 1.0)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private let emailLabel: UILabel = {
        let textField = UILabel()
        textField.font = UIFont(name: "Rockwell", size: 18)
        textField.textColor = UIColor(red: 28/255.0, green: 103/255.0, blue: 41/255.0, alpha: 1.0)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private let phoneLabel: UILabel = {
        let textField = UILabel()
        textField.font = UIFont(name: "Rockwell", size: 18)
        textField.textColor = UIColor(red: 28/255.0, green: 103/255.0, blue: 41/255.0, alpha: 1.0)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private let showInfoView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(fullNameLabel)
        addSubview(emailLabel)
        addSubview(phoneLabel)
        addSubview(showInfoView)
        
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 12),
            fullNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            fullNameLabel.bottomAnchor.constraint(equalTo: emailLabel.topAnchor, constant: -12),
            fullNameLabel.trailingAnchor.constraint(equalTo: showInfoView.leadingAnchor, constant: -12),
            
            showInfoView.leadingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor, constant: 12),
            showInfoView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            showInfoView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            showInfoView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            showInfoView.widthAnchor.constraint(equalToConstant: 100),
            showInfoView.heightAnchor.constraint(equalToConstant: 100),
            
            emailLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 12),
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            emailLabel.bottomAnchor.constraint(equalTo: phoneLabel.topAnchor, constant: -12),
            emailLabel.trailingAnchor.constraint(equalTo: showInfoView.leadingAnchor, constant: -12),
            
            phoneLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 12),
            phoneLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            phoneLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            phoneLabel.trailingAnchor.constraint(equalTo: showInfoView.leadingAnchor, constant: -12),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawUserData(user: UserInfo, resource: String) {
        fullNameLabel.text = "\(user.name) \(user.lastname) \(user.secondLastname)"
        emailLabel.text = "Email: \(user.email)"
        phoneLabel.text = "Phone: \(user.phoneNumber)"
        showInfoView.image = UIImage(systemName: "person.fill")
    }
    
}
