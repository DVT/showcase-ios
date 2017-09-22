//
//  DVTShowcaseViewController.swift
//  DVTShowcase
//
//  Created by Idris SOP on 2017/09/18.
//  Copyright © 2017 DVT. All rights reserved.
//

import UIKit
import KVSpinnerView
import MessageUI
import CoreLocation


class DVTShowcaseViewController: UIViewController, MFMailComposeViewControllerDelegate, CLLocationManagerDelegate {

    private var locationManager: CLLocationManager?
    private var myLocation: CLLocationCoordinate2D?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.distanceFilter = kCLDistanceFilterNone
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        
        if #available(iOS 8.0, *) {
            if CLLocationManager.authorizationStatus() == .notDetermined {
                locationManager?.requestWhenInUseAuthorization()
                locationManager?.requestAlwaysAuthorization()
                locationManager?.startUpdatingLocation()
            }
        } else {
            locationManager?.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last! as CLLocation
        myLocation = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        manager.stopUpdatingLocation()
    }

    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .destructive, handler: nil)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func sendEmail(emailAddress: String) {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients([emailAddress])
        mailComposerVC.setSubject("")
        mailComposerVC.setMessageBody("", isHTML: false)
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposerVC, animated: true, completion: nil)
        } else {
            self.showAlert(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.")
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func makeCall(busPhone: String) {
        if let url = URL(string: "tel://\(busPhone)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }

    func openMap(latitude: Double?, longitude:Double?, dvtOffice: String?) {
        print("Latitude: \(String(describing: latitude)) & Longitude: \(String(describing: longitude))")
        
        let alertController = UIAlertController(title: "Get Direction to ".appending(dvtOffice!), message: "", preferredStyle: .actionSheet)
        let appleMapAction = UIAlertAction(title: "Open in Apple Maps", style: .default) { (action) in
            let bigBen = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
            CMMapLauncher.launch(.appleMaps, forDirectionsTo: CMMapPoint(name: nil, coordinate: bigBen))
        }
        alertController.addAction(appleMapAction)
        
        let googleMapAction = UIAlertAction(title: "Open in Google Maps", style: .default) { (action) in
            let bigBen = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
            CMMapLauncher.launch(.googleMaps, forDirectionsTo: CMMapPoint(name: nil, coordinate: bigBen))
        }
        
        let wazeMapAction = UIAlertAction(title: "Open in Wize Maps", style: .default) { (action) in
            let bigBen = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
            CMMapLauncher.launch(.waze, forDirectionsTo: CMMapPoint(name: nil, coordinate: bigBen))
        }
        
        let cityMapperMapAction = UIAlertAction(title: "Open in Citymapper Maps", style: .default) { (action) in
            let bigBen = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
            CMMapLauncher.launch(.citymapper, forDirectionsTo: CMMapPoint(name: nil, coordinate: bigBen))
        }
        
        let transitMapAction = UIAlertAction(title: "Open in Transit Maps", style: .default) { (action) in
            let bigBen = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
            CMMapLauncher.launch(.theTransitApp, forDirectionsTo: CMMapPoint(name: nil, coordinate: bigBen))
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
    
        
        let googleMapinstalled = CMMapLauncher.isMapAppInstalled(.googleMaps)
        if googleMapinstalled {
            alertController.addAction(googleMapAction)
        }
        
        let wazeMapinstalled = CMMapLauncher.isMapAppInstalled(.waze)
        if wazeMapinstalled {
            alertController.addAction(wazeMapAction)
        }
        
        let cityMapperinstalled = CMMapLauncher.isMapAppInstalled(.citymapper)
        if cityMapperinstalled {
            alertController.addAction(cityMapperMapAction)
        }
        
        let transitMapinstalled = CMMapLauncher.isMapAppInstalled(.theTransitApp)
        if transitMapinstalled {
            alertController.addAction(transitMapAction)
        }
        
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
