//
//  UserListTableViewCell.swift
//  Assignment17MVVM
//
//  Created by Ebillson Grand Jean on 6/17/24.
//

import UIKit

class UserListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
