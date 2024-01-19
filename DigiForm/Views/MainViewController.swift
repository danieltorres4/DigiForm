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
        
        // BACKGROUND COLOR
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.systemTeal.cgColor, UIColor.systemMint.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
