//
//  AboutTableViewCell.swift
//  DVTShowcase
//
//  Created by Idris SOP on 2017/09/26.
//  Copyright © 2017 DVT. All rights reserved.
//

import UIKit

class AboutTableViewCell: UITableViewCell {

    @IBOutlet weak var aboutLabel: UILabel!

    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var facebookIconButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var twitterIconButton: UIButton!
    @IBOutlet weak var websiteIconButton: UIButton!
    @IBOutlet weak var websiteButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
