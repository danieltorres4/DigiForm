//
//  ShowInfoViewController.swift
//  DigiForm
//
//  Created by Daniel ST on 18/01/24.
//

import UIKit

class ShowInfoViewController: UIViewController {

    //@IBOutlet weak var userInfoTableView: UITableView!
    private let userInfoTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "User's Info"
        
        // BACKGROUND COLOR
        view.backgroundColor = UIColor(red: 42/255.0, green: 162/255.0, blue: 186/255.0, alpha: 1.0)
        userInfoTableView.backgroundColor = .orange
        view.addSubview(userInfoTableView)
        
        // CONSTRAINTS
        NSLayoutConstraint.activate([
            userInfoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userInfoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            userInfoTableView.topAnchor.constraint(equalTo: view.topAnchor),
            userInfoTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // CUSTOM CELL
        userInfoTableView.register(UserInfoTableViewCell.self, forCellReuseIdentifier: "UserInfoTableViewCell")
        userInfoTableView.delegate = self
        userInfoTableView.dataSource = self
        userInfoTableView.backgroundColor = .systemTeal
    }

}

extension ShowInfoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped me")
        tableView.deselectRow(at: indexPath, animated: true)
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
            cell.drawUserData(user: UserInfo(name: "", lastname: "", secondLastname: "", email: "No Data Found", phoneNumber: "Try again later"), resource: "")
            return cell
        }
        
        let user = userInfo[indexPath.row]
        //cell.userImageView.image = (indexPath.row % 2 == 0) ? UIImage(systemName: "person.fill") : UIImage(systemName: "person")
        cell.backgroundColor = (indexPath.row % 2 == 0) ? UIColor(red: 42/255.0, green: 162/255.0, blue: 186/255.0, alpha: 1.0) : .systemTeal
        cell.drawUserData(user: user, resource: "")
        
        return cell
    }
}
