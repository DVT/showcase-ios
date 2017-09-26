//
//  ContactViewController.swift
//  DVTShowcase
//
//  Created by Idris SOP on 2017/09/19.
//  Copyright © 2017 DVT. All rights reserved.
//

import UIKit

class ContactViewController: DVTShowcaseViewController , UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var contactTableView: UITableView!

    var dvtContactArray = [[String: AnyObject?]]()
    let firebaseApi = FirebaseAPI.sharedFirebaseAPI
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "Contact"
        self.contactTableView.delegate = self
        self.contactTableView.dataSource = self
        self.contactTableView.rowHeight = UITableViewAutomaticDimension
        self.contactTableView.estimatedRowHeight = 120
        self.contactTableView.register(UINib.init(nibName: "AboutTableViewCell", bundle: nil), forCellReuseIdentifier: "CellIdentifier")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
//        self.showLoading(view: self.view)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        firebaseApi.getDVTContact { (success, dvtContactArray, message) in
            if success {
                self.dvtContactArray = dvtContactArray
                DispatchQueue.main.async(execute: { () -> Void in
                    self.contactTableView.reloadData()
//                    self.hideLoading()
                })
            } else {
//                DispatchQueue.main.async(execute: { () -> Void in
//                    self.hideLoading()
//                })
                self.showAlert(title: "Error!", message: message!)
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dvtContactArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as! ContactTableViewCell
        cell.layer.cornerRadius = 2.0
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        let dvtContact = dvtContactArray[indexPath.section]
        cell.cityNameLabel.text = dvtContact["name"] as? String
        cell.cityAddressLabel.text = dvtContact["address"] as? String
        firebaseApi.getIconImage(iconUrl: dvtContact["image"] as? String!) { (success, image, message) in
            if success {
                cell.cityImageView.image = image
            }
        }
        cell.emailButton.addTarget(self, action: #selector(emailButtonPressed(sender:)), for: .touchUpInside)
        cell.emailIconButton.addTarget(self, action: #selector(emailButtonPressed(sender:)), for: .touchUpInside)
        cell.emailButton.tag = indexPath.section
        cell.emailIconButton.tag = indexPath.section
        
        cell.callButton.addTarget(self, action: #selector(callButtonPressed(sender:)), for: .touchUpInside)
        cell.callIconButton.addTarget(self, action: #selector(callButtonPressed(sender:)), for: .touchUpInside)
        cell.callButton.tag = indexPath.section
        cell.callIconButton.tag = indexPath.section
        
        cell.navigateButton.addTarget(self, action: #selector(navigateButtonPressed(sender:)), for: .touchUpInside)
        cell.navigateIconButton.addTarget(self, action: #selector(navigateButtonPressed(sender:)), for: .touchUpInside)
        cell.navigateButton.tag = indexPath.section
        cell.navigateIconButton.tag = indexPath.section
        return cell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let dvtContact = dvtContactArray[indexPath.section]
        let cityAddressText = dvtContact["address"] as? String
        return 310 + heightForText(text: cityAddressText!)
    }
    
    func heightForText(text: String) -> CGFloat {
        let MAX_HEIGHT = 20000
        let textView = UITextView(frame: CGRect(x: 0, y: 0, width: 320, height: MAX_HEIGHT))
        textView.text = text
        textView.font = UIFont.boldSystemFont(ofSize: 17)
        textView.sizeToFit()
        return textView.frame.size.height
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 15
    }

    func emailButtonPressed(sender: UIButton) {
        let dvtContact = dvtContactArray[sender.tag]
        self.sendEmail(emailAddress: (dvtContact["emailAddress"] as? String)!)
    }
    
    func callButtonPressed(sender: UIButton) {
        let dvtContact = dvtContactArray[sender.tag]
        self.makeCall(busPhone: (dvtContact["telephone"] as? String)!)
    }
    
    func navigateButtonPressed(sender: UIButton) {
        let dvtContact = dvtContactArray[sender.tag]
        self.openMap(latitude: (dvtContact["latitude"] as? Double)!, longitude: (dvtContact["longitude"] as? Double)!, dvtOffice: (dvtContact["googleMapsName"] as? String)! )
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
