//
//  ShowcaseAppTableViewCell.swift
//  DVTShowcase
//
//  Created by Idris SOP on 2017/09/20.
//  Copyright © 2017 DVT. All rights reserved.
//

import UIKit

class ShowcaseAppTableViewCell: UITableViewCell {
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var clientNameLabel: UILabel!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    @IBOutlet weak var appIconImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
