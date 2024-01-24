//
//  MainViewController.swift
//  DigiForm
//
//  Created by Daniel ST on 16/01/24.
//

import UIKit

class MainViewController: UIViewController {
    override func loadView() {
        self.view = MainView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 42/255.0, green: 162/255.0, blue: 186/255.0, alpha: 1.0)
    }
}
