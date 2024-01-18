//
//  ShowInfoViewController.swift
//  DigiForm
//
//  Created by Daniel ST on 18/01/24.
//

import UIKit

class ShowInfoViewController: UIViewController {

    @IBOutlet weak var userInfoTableView: UITableView!
    private var userInfoArray: [UserInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            cell.textLabel?.text = "Cannot obtain data from DB"
            return cell
        }
        
        let user = userInfo[indexPath.row]
        cell.fullNameLabel.text = "\(user.name) \(user.lastname) \(user.secondLastname)"
        cell.emailLabel.text = "Email: \(user.email)"
        cell.phoneNumberLabel.text = "Phone number: \(user.phoneNumber)"
        
        return cell
    }
}
