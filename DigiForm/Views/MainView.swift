//
//  MainView.swift
//  DigiForm
//
//  Created by Daniel ST on 23/01/24.
//

import Foundation
import UIKit

class MainView: UIView {
    
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
    
    
    // INITIALIZER
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubviews()
        configureConstraints()
    }
    
    private func addSubviews() {
        // SETTING UP SUBVIEWS
        [mainLabel, mainIV, fillFormButton, showSavedDataButton].forEach(addSubview)
    }
    
    private func configureConstraints() {
        // CONSTRAINTS
        var gridValue = (bounds.width) / 5
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 20),
            mainLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            // IV
            mainIV.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainIV.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 50),
            mainIV.widthAnchor.constraint(equalToConstant: 300),
            mainIV.heightAnchor.constraint(equalToConstant: 300),
            
            // BUTTONS
            fillFormButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 75),
            fillFormButton.topAnchor.constraint(equalTo: mainIV.bottomAnchor, constant: 20),
            showSavedDataButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -75),
            showSavedDataButton.topAnchor.constraint(equalTo: mainIV.bottomAnchor, constant: 20),
            showSavedDataButton.widthAnchor.constraint(equalTo: fillFormButton.widthAnchor),
            fillFormButton.trailingAnchor.constraint(equalTo: showSavedDataButton.leadingAnchor, constant: -75)
        ])
    }
}


// ACTION METHODS
extension MainView {
    @objc func fillFormVC() {
        
    }
    
    @objc func showSavedDataVC() {
        
    }
}
