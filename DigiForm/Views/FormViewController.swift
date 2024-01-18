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


extension FormViewController {
    private func validateTextFieldEntries() {
        
        if let name = nameTextField.text, let lastname = lastnameTextField.text, let secondLastname = secondLastnameTextField.text, let email = emailTextField.text, let phoneNumber = phoneNumberTextField.text {
            
            if(name != "" && lastname != "" && secondLastname != "" && email != "" && phoneNumber != "") {
                print("SAVED")
                showAlert(title: "Saved", message: "Your info has been saved successfully")
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
}
