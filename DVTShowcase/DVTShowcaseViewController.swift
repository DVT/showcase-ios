//
//  DVTShowcaseViewController.swift
//  DVTShowcase
//
//  Created by Idris SOP on 2017/09/18.
//  Copyright © 2017 DVT. All rights reserved.
//

import UIKit
import KVSpinnerView

class DVTShowcaseViewController: UIViewController {

//    fileprivate var loadingViews: [String:DVTShowcaseLoadingView] = [String: DVTShowcaseLoadingView]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .destructive, handler: nil)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showLoading(view: UIView) {
        KVSpinnerView.show(on: self.view)
    }
    
    func hideLoading() {
        KVSpinnerView.dismiss()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
