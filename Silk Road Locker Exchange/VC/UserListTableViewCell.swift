//
//  UserListTableViewCell.swift
//  Silk Road Locker Exchange
//
//  Created by Alex Agarkov on 06.07.2022.
//

import UIKit

class UserListTableViewCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var avatarImage: AsyncImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
