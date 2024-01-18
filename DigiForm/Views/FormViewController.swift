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
    }

    @IBAction func didTapSaveBtn(_ sender: Any) {
        validateTextFieldEntries()
    }
}


/// Validations and alerts
extension FormViewController {
    private func validateTextFieldEntries() {
        
        if let name = nameTextField.text, let lastname = lastnameTextField.text, let secondLastname = secondLastnameTextField.text, let email = emailTextField.text, let phoneNumber = phoneNumberTextField.text {
            
            if(name != "" && lastname != "" && secondLastname != "" && email != "" && phoneNumber != "") {
                print("SAVED")
                showAlertWithTwoActions(title: "Trying to save info", message: "Are you sure you want to save your current info?", name: name, lastname: lastname, secondLastname: secondLastname, email: email, phoneNumber: phoneNumber)
            } else {
                print("CANNOT SAVE")
                showAlert(title: "Text Fields", message: "All the text fields should be filled")
            }
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func showAlertWithTwoActions(title: String, message: String, name: String, lastname: String, secondLastname: String, email: String, phoneNumber: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let acceptAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.insertUserInfo(name: name, lastname: lastname, secondLastname: secondLastname, email: email, phoneNumber: phoneNumber)
            self.showAlert(title: "Info saved", message: "Your info has been saved")
            self.clearTextFields()
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
