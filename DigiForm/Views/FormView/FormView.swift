//
//  FormView.swift
//  DigiForm
//
//  Created by Daniel ST on 23/01/24.
//

import Foundation
import UIKit

class FormView: UIView {
    // LABELS
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Name"
        label.font = UIFont(name: "Rockwell", size: 17)
        label.textColor = UIColor(red: 28/255.0, green: 103/255.0, blue: 41/255.0, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let lastnameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Lastname"
        label.font = UIFont(name: "Rockwell", size: 17)
        label.textColor = UIColor(red: 28/255.0, green: 103/255.0, blue: 41/255.0, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let secondLastnameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Second lastname"
        label.font = UIFont(name: "Rockwell", size: 17)
        label.textColor = UIColor(red: 28/255.0, green: 103/255.0, blue: 41/255.0, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Email"
        label.font = UIFont(name: "Rockwell", size: 17)
        label.textColor = UIColor(red: 28/255.0, green: 103/255.0, blue: 41/255.0, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Phone Number"
        label.font = UIFont(name: "Rockwell", size: 17)
        label.textColor = UIColor(red: 28/255.0, green: 103/255.0, blue: 41/255.0, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    // TEXT FIELDS
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Your name"
        textField.font = UIFont(name: "Rockwell", size: 12)
        textField.borderStyle = .roundedRect
        textField.textColor = UIColor(red: 28/255.0, green: 103/255.0, blue: 41/255.0, alpha: 1.0)
        textField.keyboardType = .default
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private let lastnameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Your lastname"
        textField.font = UIFont(name: "Rockwell", size: 12)
        textField.borderStyle = .roundedRect
        textField.textColor = UIColor(red: 28/255.0, green: 103/255.0, blue: 41/255.0, alpha: 1.0)
        textField.keyboardType = .default
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private let secondLastnameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Your second lastname"
        textField.font = UIFont(name: "Rockwell", size: 12)
        textField.borderStyle = .roundedRect
        textField.textColor = UIColor(red: 28/255.0, green: 103/255.0, blue: 41/255.0, alpha: 1.0)
        textField.keyboardType = .default
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Your email"
        textField.font = UIFont(name: "Rockwell", size: 12)
        textField.borderStyle = .roundedRect
        textField.textColor = UIColor(red: 28/255.0, green: 103/255.0, blue: 41/255.0, alpha: 1.0)
        textField.keyboardType = .emailAddress
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private let phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Your phone number"
        textField.font = UIFont(name: "Rockwell", size: 12)
        textField.borderStyle = .roundedRect
        textField.textColor = UIColor(red: 28/255.0, green: 103/255.0, blue: 41/255.0, alpha: 1.0)
        textField.keyboardType = .phonePad
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    
    // BUTTON
    private lazy var saveButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Save"
        config.background.backgroundColor = UIColor(red: 28/255.0, green: 103/255.0, blue: 41/255.0, alpha: 1.0)
        
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(saveFormAction), for: .touchUpInside)
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    // INITIALIZER
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubviews()
        configureConstraints()
    }
    
    private func addSubviews() {
        // SETTING UP SUBVIEWS
        [nameLabel, lastnameLabel, secondLastnameLabel, emailLabel, phoneNumberLabel, nameTextField, lastnameTextField, secondLastnameTextField, emailTextField, phoneNumberTextField, saveButton].forEach(addSubview)
    }
    
    private func configureConstraints() {
        // CONSTRAINTS
        NSLayoutConstraint.activate([
            // Name
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            nameLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 30),
            nameLabel.widthAnchor.constraint(equalToConstant: 125),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            nameTextField.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 20),
            nameTextField.widthAnchor.constraint(equalToConstant: 175),
            nameLabel.trailingAnchor.constraint(equalTo: nameTextField.leadingAnchor, constant: -25),

            // Lastname
            lastnameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            lastnameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 40),
            lastnameLabel.widthAnchor.constraint(equalToConstant: 125),
            lastnameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            lastnameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            lastnameTextField.widthAnchor.constraint(equalToConstant: 175),
            lastnameLabel.trailingAnchor.constraint(equalTo: lastnameTextField.leadingAnchor, constant: -25),

            // SecondLastname
            secondLastnameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            secondLastnameLabel.topAnchor.constraint(equalTo: lastnameLabel.bottomAnchor, constant: 25),
            secondLastnameLabel.widthAnchor.constraint(equalToConstant: 125),
            secondLastnameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            secondLastnameTextField.topAnchor.constraint(equalTo: lastnameTextField.bottomAnchor, constant: 20),
            secondLastnameTextField.widthAnchor.constraint(equalToConstant: 175),
            secondLastnameLabel.trailingAnchor.constraint(equalTo: secondLastnameTextField.leadingAnchor, constant: -25),

            // Email
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            emailLabel.topAnchor.constraint(equalTo: secondLastnameLabel.bottomAnchor, constant: 30),
            emailLabel.widthAnchor.constraint(equalToConstant: 125),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            emailTextField.topAnchor.constraint(equalTo: secondLastnameTextField.bottomAnchor, constant: 20),
            emailTextField.widthAnchor.constraint(equalToConstant: 175),
            emailLabel.trailingAnchor.constraint(equalTo: emailTextField.leadingAnchor, constant: -25),

            // PhoneNumber
            phoneNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            phoneNumberLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 30),
            phoneNumberLabel.widthAnchor.constraint(equalToConstant: 125),
            phoneNumberTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            phoneNumberTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            phoneNumberTextField.widthAnchor.constraint(equalToConstant: 175),
            phoneNumberLabel.trailingAnchor.constraint(equalTo: phoneNumberTextField.leadingAnchor, constant: -25),
            
            // Button
            saveButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            saveButton.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 60),
            saveButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 125),
            saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -125)
        ])
    }
}

extension FormView {
    @objc func saveFormAction() {
        
    }
}
