//
//  FormViewController.swift
//  DigiForm
//
//  Created by Daniel ST on 17/01/24.
//

import UIKit

class FormViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var secondLastnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // BACKGROUND COLOR
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.systemTeal.cgColor, UIColor.systemMint.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

    @IBAction func didTapSaveBtn(_ sender: Any) {
        validateTextFieldEntries()
    }
}


/// Validations and alerts
extension FormViewController {
    /// Validates the whole textfields with regex
    private func validateTextFieldEntries() {
        
        if let name = nameTextField.text, let lastname = lastnameTextField.text, let secondLastname = secondLastnameTextField.text, let email = emailTextField.text, let phoneNumber = phoneNumberTextField.text {
            
            if(name.isValidWith(regexType: .name) && lastname.isValidWith(regexType: .name) && secondLastname.isValidWith(regexType: .name)) {
                if(email.isValidWith(regexType: .email)) {
                    if(phoneNumber.isValidWith(regexType: .onlyNumbers)) {
                        showAlertWithTwoActions(title: "Trying to save info", message: "Are you sure you want to save your current info?", name: name, lastname: lastname, secondLastname: secondLastname, email: email, phoneNumber: phoneNumber)
                    } else {
                        showAlert(title: "Phone number", message: "Phone number must contain only numbers", dbResponse: false)
                    }
                } else {
                    showAlert(title: "Email", message: "Invalid email", dbResponse: false)
                }
            } else {
                showAlert(title: "Text Fields", message: "First name and last name fields must contain only letters", dbResponse: false)
            }
        }
    }
    
    private func showAlert(title: String, message: String, dbResponse: Bool) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            if(dbResponse) {
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func showAlertWithTwoActions(title: String, message: String, name: String, lastname: String, secondLastname: String, email: String, phoneNumber: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let acceptAction = UIAlertAction(title: "OK", style: .default) { _ in
            let insertIntoDBResponse = self.insertUserInfo(name: name, lastname: lastname, secondLastname: secondLastname, email: email, phoneNumber: phoneNumber)
            if(insertIntoDBResponse) {
                self.showAlert(title: "Info saved", message: "Your info has been saved", dbResponse: insertIntoDBResponse)
                self.clearTextFields()
            } else {
                self.showAlert(title: "Error", message: "Your info has not been saved. Try again, please.", dbResponse: insertIntoDBResponse)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        alert.addAction(acceptAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func clearTextFields() {
        nameTextField.text = ""
        lastnameTextField.text = ""
        secondLastnameTextField.text = ""
        phoneNumberTextField.text = ""
        emailTextField.text = ""
    }
}


/// Database methods
private extension FormViewController {
    func insertUserInfo(name: String, lastname: String, secondLastname: String, email: String, phoneNumber: String) -> Bool {
        return Database.shared.insertUserInfo(name: name, lastname: lastname, secondLastname: secondLastname, email: email, phoneNumber: phoneNumber)
    }
}
