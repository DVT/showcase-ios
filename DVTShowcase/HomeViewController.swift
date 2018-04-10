
import UIKit


class HomeViewController: DVTShowcaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var showcaseAppTableView: UITableView!

    //MARK: Properties
    
    var showcaseAppArray = [[String: AnyObject?]]()
    let firebaseApi = FirebaseAPI.sharedFirebaseAPI
    
    //MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let narBArImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 40))
        narBArImageView.image = UIImage(named: "dvt_icon")
        self.navigationItem.title = "DVT App Showcase"
        self.showcaseAppTableView.delegate = self
        self.showcaseAppTableView.dataSource = self
        self.showcaseAppTableView.rowHeight = UITableViewAutomaticDimension
        self.showcaseAppTableView.estimatedRowHeight = 130
        self.showcaseAppTableView.register(UINib.init(nibName: "ShowcaseAppTableViewCell", bundle: nil), forCellReuseIdentifier: "CellIdentifier")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        firebaseApi.getShowcaseApp { (success, showcaseAppArray, message) in
            if success {
                self.showcaseAppArray = showcaseAppArray
                DispatchQueue.main.async(execute: { () -> Void in
                    self.showcaseAppTableView.reloadData()
                })
            } else {
                self.showAlert(title: "Error!", message: message!)
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  showcaseAppArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as! ShowcaseAppTableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        let showcaseApps = showcaseAppArray[indexPath.row]
        cell.appNameLabel.text = showcaseApps["name"] as? String
        cell.clientNameLabel.text = showcaseApps["client"] as? String
        cell.shortDescriptionLabel.text = showcaseApps["shortDescription"] as? String
        firebaseApi.getIconImage(iconUrl: showcaseApps["iconUrl"] as? String!) { (success, image, message) in
            if success {
                cell.appIconImageView.image = image
            }
        }
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8
    }
    
    func heightForText(text: String) -> CGFloat {
        let MAX_HEIGHT = 20000
        let textView = UITextView(frame: CGRect(x: 0, y: 0, width: 320, height: MAX_HEIGHT))
        textView.text = text
        textView.font = UIFont.boldSystemFont(ofSize: 17)
        textView.sizeToFit()
        return textView.frame.size.height
    }

    
    
    
}
