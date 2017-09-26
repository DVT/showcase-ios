//
//  LoginViewController.swift
//  DVTShowcase
//
//  Created by Idris SOP on 2017/09/18.
//  Copyright © 2017 DVT. All rights reserved.
//

import UIKit


class LoginViewController: DVTShowcaseViewController, UITextFieldDelegate {
    @IBOutlet weak var usernameTF: UITextField?
    @IBOutlet weak var passwordTF: UITextField?
    fileprivate var loginBarButtonItem:UIBarButtonItem?
    fileprivate var missingLoginBarButtonItem:UIBarButtonItem?
    @IBOutlet var loginContainerView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startup()
        let loginBtn = UIButton(type: .custom)
        loginBtn.frame = CGRect(x: 0, y: 0, width: 80, height: 35)
        loginBtn.setTitle("Log in", for: .normal)
        loginBtn.titleLabel?.font = UIFont(name: "EuphemiaUCAS-Bold", size: 16.0)
        loginBtn.setTitleColor(UIColor.white, for: .normal)
        loginBtn.backgroundColor = DVTShowcaseColor.blueColor
        loginBtn.layer.cornerRadius = 8.0
        loginBtn.addTarget(self, action: #selector(authenticateUser(sender:)), for: .touchUpInside)
        
        loginBarButtonItem = UIBarButtonItem(customView: loginBtn)
        missingLoginBarButtonItem = UIBarButtonItem(title: "Missing login details?", style: UIBarButtonItemStyle.plain, target: self, action: #selector(emailButtonPressed(sender:)))
        missingLoginBarButtonItem?.tintColor = DVTShowcaseColor.blueColor
        let itemFlexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: 45.0))
        toolBar.isTranslucent = true
        toolBar.items = [missingLoginBarButtonItem!, itemFlexibleSpace, loginBarButtonItem!]
        
        usernameTF?.delegate = self
        usernameTF?.inputAccessoryView = toolBar
        passwordTF?.delegate = self
        passwordTF?.inputAccessoryView = toolBar
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.usernameTF?.becomeFirstResponder()
        usernameTF?.text = "isop@jhb.dvt.co.za"
        passwordTF?.text = "password"
    }
    
    func authenticateUser(sender: UIBarButtonItem) {
        var params = [String: String]()
        params["username"] = usernameTF?.text!
        params["password"] = passwordTF?.text!
        if usernameTF?.text! != "" &&  passwordTF?.text! != "" {
            self.showLoading(view: self.view)
            let firebaseApi = FirebaseAPI.sharedFirebaseAPI
            firebaseApi.authenticateUser(params: params) { (success, message) in
                if success {
                    print("success")
                    DispatchQueue.main.async(execute: { () -> Void in
                        self.hideLoading()
                    })
                    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let dvtShowcaseTabController = mainStoryboard.instantiateViewController(withIdentifier: "dvtShowcaseTabController")
                    self.show(dvtShowcaseTabController, sender: nil)
                    UserDefaults.standard.set(true, forKey: "DidLoggedIn")
                    UserDefaults.standard.synchronize()
                } else {
                    DispatchQueue.main.async(execute: { () -> Void in
                        self.hideLoading()
                    })
                    print("false")
                    self.showAlert(title: "Invalid Login!", message: message!)
                }
            }
        } else {
            self.showAlert(title: "Invalid Login!", message: "Username and Password are required.")
        }
    }
    
    func startup() {
        UIView.animate(withDuration: 0.5, delay: 0.2, options:  UIViewAnimationOptions.allowAnimatedContent, animations: {
            var loginViewRect : CGRect
            loginViewRect = (self.loginContainerView?.frame)!;
            loginViewRect.origin.y -= (((self.loginContainerView?.frame.origin.x)! + (self.loginContainerView?.frame.size.height)!) / 2) - 100 - 50;
            self.loginContainerView?.frame = loginViewRect
        }) { (true) in
            UIView.animate(withDuration: 0.5, animations: {
                var loginViewRect : CGRect
                loginViewRect = (self.loginContainerView?.frame)!;
                loginViewRect.origin.y += 0;
                self.loginContainerView?.frame = loginViewRect
            })
        }
    }
    
    func emailButtonPressed(sender: UIBarButtonItem) {
        self.sendEmail(emailAddress: "mobile@dvt.co.za")
    }
}


