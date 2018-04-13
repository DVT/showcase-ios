//
//  DVTApp.swift
//  DVTShowcase
//
//  Created by Idris SOP on 2017/09/20.
//  Copyright © 2017 DVT. All rights reserved.
//

import UIKit

class DVTApp: NSObject {
    
    var client: String?
    var appName: String?
    var shortDescription: String?
    var functionality: String?
    var industry: String?
    var technologyUsed: String?
    var iconUrl: String?
    var longDescription: String?
    var screenshots: [String]?
    
    init(with dictionary: [String: AnyObject]) {
        if let name = dictionary["client"] as? String { self.client = name }
        if let appName = dictionary["name"] as? String { self.appName = appName }
        if let shortDescription = dictionary["shortDescription"] as? String { self.shortDescription = shortDescription }
        if let functionality = dictionary["functionality"] as? String { self.functionality = functionality }
        if let industry = dictionary["industry"] as? String { self.industry = industry }
        if let technologyUsed = dictionary["technologyUsed"] as? String { self.technologyUsed = technologyUsed }
        if let iconUrl = dictionary["iconUrl"] as? String { self.iconUrl = iconUrl }
        if let screenshots = dictionary["screenshots"] as? [String] { self.screenshots = screenshots }
        
        
    }
}
