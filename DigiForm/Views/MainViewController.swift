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
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.systemTeal.cgColor, UIColor.systemMint.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
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
