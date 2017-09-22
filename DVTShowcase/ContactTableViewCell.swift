//
//  ContactTableViewCell.swift
//  DVTShowcase
//
//  Created by Idris SOP on 2017/09/22.
//  Copyright © 2017 DVT. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityAddressLabel: UILabel!
    @IBOutlet weak var emailIconButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var callIconButton: UIButton!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var navigateIconButton: UIButton!
    @IBOutlet weak var navigateButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
