//
//  MainViewController.swift
//  DigiForm
//
//  Created by Daniel ST on 16/01/24.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var fillFormBtn: UIButton!
    @IBOutlet weak var showInfoBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapFillFormBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let formVC = storyboard.instantiateViewController(withIdentifier: "FormViewControllerID")
        self.present(formVC, animated: true)
    }
    
    @IBAction func didTapShowInfoBtn(_ sender: Any) {
        if let value = Database.shared.readUserInfo() {
            showAlert(title: "Data Found", message: "Name: \(value)")
        } else {
            showAlert(title: "Error", message: "Cannot found data. You have not saved your info yet")
        }
        
    }
}

extension MainViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
}
