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
    
    @IBAction func didTapShowInfoBtn(_ sender: Any) {
        if let value = Database.shared.readUserInfo(), value.count > 0 {
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
