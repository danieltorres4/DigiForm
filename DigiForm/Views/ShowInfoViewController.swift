//
//  ShowInfoViewController.swift
//  DigiForm
//
//  Created by Daniel ST on 18/01/24.
//

import UIKit

class ShowInfoViewController: UIViewController {

    @IBOutlet weak var userInfoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // BACKGROUND COLOR
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.systemTeal.cgColor, UIColor.systemMint.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        // CUSTOM CELL
        let nib = UINib(nibName: "UserInfoTableViewCell", bundle: nil)
        userInfoTableView.register(nib, forCellReuseIdentifier: "UserInfoTableViewCell")
        userInfoTableView.delegate = self
        userInfoTableView.dataSource = self
        userInfoTableView.backgroundColor = .systemTeal
    }

}

extension ShowInfoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped me")
    }
}

extension ShowInfoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let userInfo = Database.shared.readUserInfo(), userInfo.count > 0 else { return 1 }
        return userInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userInfoTableView.dequeueReusableCell(withIdentifier: "UserInfoTableViewCell", for: indexPath) as! UserInfoTableViewCell
        guard let userInfo = Database.shared.readUserInfo(), userInfo.count > 0 else {
            // Drawing default data if there is no info stored
            cell.fullNameLabel.text = ""
            cell.emailLabel.text = "No information stored in database"
            cell.phoneNumberLabel.text = ""
            cell.userImageView.image = UIImage(systemName: "person.2.slash.fill")
            return cell
        }
        
        let user = userInfo[indexPath.row]
        cell.fullNameLabel.text = "\(user.name) \(user.lastname) \(user.secondLastname)"
        cell.emailLabel.text = "Email: \(user.email)"
        cell.phoneNumberLabel.text = "Phone number: \(user.phoneNumber)"
        
        return cell
    }
}
