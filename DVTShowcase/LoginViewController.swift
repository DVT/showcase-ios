//
//  LoginViewController.swift
//  DVTShowcase
//
//  Created by Idris SOP on 2017/09/18.
//  Copyright © 2017 DVT. All rights reserved.
//

import UIKit

class LoginViewController: DVTShowcaseViewController, UITextFieldDelegate {
    @IBOutlet var usernameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    fileprivate var loginBarButtonItem:UIBarButtonItem!
    fileprivate var missingLoginBarButtonItem:UIBarButtonItem!
    @IBOutlet var loginContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let loginBtn = UIButton(type: .custom)
        loginBtn.frame = CGRect(x: 0, y: 0, width: 80, height: 35)
        loginBtn.setTitle("Log in", for: .normal)
        loginBtn.titleLabel?.font = UIFont(name: "EuphemiaUCAS-Bold", size: 16.0)
        loginBtn.setTitleColor(UIColor.white, for: .normal)
        loginBtn.backgroundColor = DVTShowcaseColor.greenColor
        loginBtn.layer.cornerRadius = 8.0
        loginBtn.addTarget(self, action: #selector(authenticeUser(sender:)), for: .touchUpInside)
        
        loginBarButtonItem = UIBarButtonItem(customView: loginBtn)
        missingLoginBarButtonItem = UIBarButtonItem(title: "Missing login details?", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        missingLoginBarButtonItem.tintColor = DVTShowcaseColor.greenColor
        let itemFlexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: 45.0))
        toolBar.isTranslucent = true
        toolBar.items = [missingLoginBarButtonItem, itemFlexibleSpace, loginBarButtonItem]
        
        usernameTF.delegate = self
        usernameTF.inputAccessoryView = toolBar
        passwordTF.delegate = self
        passwordTF.inputAccessoryView = toolBar
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.startup()
        usernameTF.becomeFirstResponder()
    }
    
    func authenticeUser(sender: UIBarButtonItem) {
        
    }
    
    func startup() {
        UIView.animate(withDuration: 0.5, delay: 0.2, options:  UIViewAnimationOptions.allowAnimatedContent, animations: {
            var loginViewRect : CGRect
            loginViewRect = self.loginContainerView.frame;
            loginViewRect.origin.y -= ((self.loginContainerView.frame.origin.x + self.loginContainerView.frame.size.height) / 2) - 100 - 50;
            self.loginContainerView.frame = loginViewRect
        }) { (true) in
            UIView.animate(withDuration: 1.0, animations: { 
                var loginViewRect : CGRect
                loginViewRect = self.loginContainerView.frame;
                loginViewRect.origin.y += 0;
                self.loginContainerView.frame = loginViewRect
            })
        }
    }
}
