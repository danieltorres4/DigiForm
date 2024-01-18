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
        userInfoTableView.delegate = self
        userInfoTableView.dataSource = self
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
        let cell = userInfoTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let userInfo = Database.shared.readUserInfo(), userInfo.count > 0 else {
            cell.textLabel?.text = "Cannot obtain data from DB"
            return cell
        }
        
        let user = userInfo[indexPath.row]
        cell.textLabel?.text = user.name
        
        return cell
    }
}
