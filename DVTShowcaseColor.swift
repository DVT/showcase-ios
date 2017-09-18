//
//  DVTShowcaseColor.swift
//  DVTShowcase
//
//  Created by Idris SOP on 2017/09/18.
//  Copyright © 2017 DVT. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(rgb: UInt) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

class DVTShowcaseColor: NSObject {
    static var greenColor  = UIColor(red:0.0/255.0, green:105.0/255.0, blue:177.0/255.0, alpha:1.0)
    static var yellowColor  = UIColor(red:255.0/255.0, green:199.0/255.0, blue:44.0/255.0, alpha:1.0)
}
