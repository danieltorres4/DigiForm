//
//  MainViewController.swift
//  DigiForm
//
//  Created by Daniel ST on 16/01/24.
//

import UIKit

class MainViewController: UIViewController {
    // SUBVIEWS
    private let mainIV: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "eou2")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "DigiForm"
        label.font = UIFont(name: "Rockwell", size: 50)
        label.textColor = UIColor(red: 28/255.0, green: 103/255.0, blue: 41/255.0, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var fillFormButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Fill Form"
        config.background.backgroundColor = UIColor(red: 28/255.0, green: 103/255.0, blue: 41/255.0, alpha: 1.0)
        
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(fillFormVC), for: .touchUpInside)
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var showSavedDataButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Show Info"
        config.background.backgroundColor = UIColor(red: 28/255.0, green: 103/255.0, blue: 41/255.0, alpha: 1.0)
        config.titleAlignment = .center
        
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(showSavedDataVC), for: .touchUpInside)
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 42/255.0, green: 162/255.0, blue: 186/255.0, alpha: 1.0)
        
        setup()
    }
}

extension MainViewController {
    private func setup() {
        addSubviews()
        configureConstraints()
    }
    
    private func addSubviews() {
        // SETTING UP SUBVIEWS
        [mainLabel, mainIV, fillFormButton, showSavedDataButton].forEach(view.addSubview)
    }
    
    private func configureConstraints() {
        // CONSTRAINTS
        var gridValue = (view.bounds.width) / 5
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // IV
            mainIV.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainIV.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 50),
            mainIV.widthAnchor.constraint(equalToConstant: 300),
            mainIV.heightAnchor.constraint(equalToConstant: 300),
            
            // BUTTONS
            fillFormButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 75),
            fillFormButton.topAnchor.constraint(equalTo: mainIV.bottomAnchor, constant: 20),
            showSavedDataButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -75),
            showSavedDataButton.topAnchor.constraint(equalTo: mainIV.bottomAnchor, constant: 20),
            showSavedDataButton.widthAnchor.constraint(equalTo: fillFormButton.widthAnchor),
            fillFormButton.trailingAnchor.constraint(equalTo: showSavedDataButton.leadingAnchor, constant: -75)
        ])
    }
}


// ACTION METHODS
extension MainViewController {
    @objc func fillFormVC() {
        self.navigationController?.pushViewController(FormViewController(), animated: true)
    }
    
    @objc func showSavedDataVC() {
        print("SHOW SAVED DATA")
        if let userInfo = Database.shared.readUserInfo(), userInfo.count > 0 {
            // push view controller
            print("SAVED DATA\n\(userInfo)")
        } else {
            // alert
            showAlert(title: "Error", message: "There is no info saved yet", dbResponse: false)
        }
    }
}


// ALERT
extension MainViewController {
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
}
