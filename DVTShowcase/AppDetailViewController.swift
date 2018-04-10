

import UIKit

class AppDetailViewController: UIViewController {

    private var selectedApp: [String: AnyObject?]
    
    //MARK: IBOutlets
    
    @IBOutlet weak var nameContentView: UIView!
    @IBOutlet weak var galleryContentView: UIView!
    @IBOutlet weak var descriptionContentView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = selectedApp["name"] as? String

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    init(with dvtApp:[String: AnyObject?]) {
        selectedApp = dvtApp
        super.init(nibName: String(describing: AppDetailViewController.self), bundle: nil)
    }
   
    required init?(coder aDecoder: NSCoder) {
        self.selectedApp = [:]
        super.init(coder: aDecoder)
    }

}
