//
//  FirebaseAPI.swift
//  DVTShowcase
//
//  Created by Idris SOP on 2017/09/19.
//  Copyright © 2017 DVT. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class FirebaseAPI: NSObject {

    public static let sharedFirebaseAPI: FirebaseAPI = {
        let instance = FirebaseAPI()
        return instance
    }()
    
    func authenticateUser(params: [String: String]?, completion: ((_ success:Bool, _ message: String?) ->())?) {
        let firebaseAuth = Auth.auth()        
        firebaseAuth.signIn(withEmail: params!["username"]! , password: params!["password"]!) { (user, error) in
            if error == nil {
                completion?(true, nil)
            } else {
                print("Error message: \(String(describing: error?.localizedDescription))")
                completion?(false, (error?.localizedDescription)!)
            }
        }
    }
}
