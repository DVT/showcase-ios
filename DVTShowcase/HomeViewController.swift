//
//  HomeViewController.swift
//  DVTShowcase
//
//  Created by Idris SOP on 2017/09/19.
//  Copyright © 2017 DVT. All rights reserved.
//

import UIKit

class HomeViewController: DVTShowcaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let narBArImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 40))
        narBArImageView.image = UIImage(named: "dvt_icon")
        self.navigationItem.title = "DVT App Showcase"
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
