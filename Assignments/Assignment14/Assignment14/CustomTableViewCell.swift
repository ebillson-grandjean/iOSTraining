//
//  CustomTableViewCell.swift
//  Assignment14
//
//  Created by Ebillson Grand Jean on 6/13/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewInfo: UIImageView!
    
    @IBOutlet weak var labelTitle: UILabel!
    
    
    @IBOutlet weak var labelDetailsInfo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
