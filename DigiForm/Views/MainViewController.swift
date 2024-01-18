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
    }
}

