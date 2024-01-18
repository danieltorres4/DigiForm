//
//  UserInfoTableViewCell.swift
//  DigiForm
//
//  Created by Daniel ST on 18/01/24.
//

import UIKit

class UserInfoTableViewCell: UITableViewCell {
    @IBOutlet var fullNameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var phoneNumberLabel: UILabel!
    @IBOutlet var userImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
