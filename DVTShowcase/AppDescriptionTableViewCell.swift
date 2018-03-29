//
//  AppDescriptionTableViewCell.swift
//  DVTShowcase
//
//  Created by Kagiso Mohajane on 2018/03/28.
//  Copyright © 2018 DVT. All rights reserved.
//

import UIKit

class AppDescriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var functionality: UILabel!
    @IBOutlet weak var technologies: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateCell(with dvtApp: [String: AnyObject]) {
        functionality.text = dvtApp["functionality"] as? String
       // technologies.text = dvtApp["technologyUsed"] as? String
        sizeToFitLabels()
    }
    func sizeToFitLabels() {
        functionality.textAlignment = NSTextAlignment.left
        //technologies.textAlignment = NSTextAlignment.left
        functionality.sizeToFit()
        //technologies.sizeToFit()
        
    }
    
}
