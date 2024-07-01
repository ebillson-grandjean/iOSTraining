//
//  CustomCountryTableViewCell.swift
//  Day26MVVMWalmartCountries
//
//  Created by Ebillson Grand Jean on 6/27/24.
//

import UIKit

class CustomCountryTableViewCell: UITableViewCell {

    @IBOutlet weak var countryFlag: UIImageView!
    
    @IBOutlet weak var countryInfos: UILabel!
    
    @IBOutlet weak var countryCapital: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
