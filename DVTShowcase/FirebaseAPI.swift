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
import FirebaseDatabase
import FirebaseStorage

class FirebaseAPI: NSObject {

    public static let sharedFirebaseAPI: FirebaseAPI = {
        let instance = FirebaseAPI()
        return instance
    }()
    
    private struct Firebase {
        static let GoogleCloudStorageURI = "gs://dvt-showcase-1b447.appspot.com/"
    }
    
    var ref: DatabaseReference?
    var databaseHandle: DatabaseHandle?
    var storage = Storage.storage()
    
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
    
    func getShowcaseApp(completion: ((_ success:Bool, _ showcaseAppArray:[[String: AnyObject]], _ message: String?) ->())?) {
        ref = Database.database().reference()
        var showcaseAppArray = [[String: AnyObject]]()
        databaseHandle = ref?.child("apps").observe(.childAdded, with: { (snapshot) in
            let value = snapshot.value as? [String : AnyObject]
            showcaseAppArray.append(value!)
            completion?(true, showcaseAppArray, nil)
        }, withCancel: { (error) in
            let showcaseAppArry = [[String: AnyObject]]()
            completion?(false, showcaseAppArry ,(error.localizedDescription))
        })
    }
    
    
    func getIconImage(iconUrl: String?, completion: ((_ success:Bool, _ iconImage:UIImage?, _ message: String?) ->())?){
        // Create a reference from a Google Cloud Storage URI
        let filenameURL = getDocumentsDirectory().appendingPathComponent(iconUrl!)
        if isIconImageSaveIntoLocalStorage(iconUrl: iconUrl!) {
            completion?(true, UIImage(contentsOfFile: filenameURL.path)!, nil)
        } else {
            let gsReference = storage.reference(forURL: Firebase.GoogleCloudStorageURI.appending(iconUrl!))
            gsReference.write(toFile: filenameURL) { (url, error) in
                if let error = error {
                    print("Error message: \(String(describing: error.localizedDescription))")
                    completion?(false, nil ,(error.localizedDescription))
                } else {
                    completion?(true, UIImage(contentsOfFile: (url?.path)!)!, nil)
                }
            }
        }
    }
    
    func getIconImageFromLocalStorage(iconUrl: String?) -> UIImage {
        let filenameURL = getDocumentsDirectory().appendingPathComponent(iconUrl!)
        return UIImage(contentsOfFile: filenameURL.path)!
    }
    
    func isIconImageSaveIntoLocalStorage(iconUrl: String?) -> Bool {
        let filePath = getDocumentsDirectory().appendingPathComponent(iconUrl!).path
        if FileManager.default.fileExists(atPath: filePath) {
            return true
        } else {
            return false
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func getDVTContact(completion: ((_ success:Bool, _ dvtContactArray:[[String: AnyObject]], _ message: String?) ->())?) {
        ref = Database.database().reference()
        var dvtContactArray = [[String: AnyObject]]()
        databaseHandle = ref?.child("offices").observe(.childAdded, with: { (snapshot) in
            let value = snapshot.value as? [String : AnyObject]
            dvtContactArray.append(value!)
            completion?(true, dvtContactArray, nil)
        }, withCancel: { (error) in
            let dvtContactArray = [[String: AnyObject]]()
            completion?(false, dvtContactArray ,(error.localizedDescription))
        })
    }
}
