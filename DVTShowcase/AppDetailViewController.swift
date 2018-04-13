

import UIKit

class AppDetailViewController: UIViewController {

    //MARK: IBOutlets
    
    @IBOutlet weak var nameContentView: UIView!
    @IBOutlet weak var galleryContentView: UIView!
    @IBOutlet weak var descriptionContentView: UIView!
    
    //MARK: Properties
    
    private var selectedApp: DVTApp
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = selectedApp.client
    }

    init(with dvtApp:DVTApp) {
        selectedApp = dvtApp
        super.init(nibName: String(describing: AppDetailViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
