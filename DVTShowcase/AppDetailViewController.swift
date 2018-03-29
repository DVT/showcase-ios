

import Foundation

class AppDetailViewController: UITableViewController {
    
    @IBOutlet var appDetailTableView: UITableView!
    
    //MARK: Properties
    
    private var selectedApp = [String: AnyObject?] ()
    private var cells = [AppDescriptionTableViewCell.self, AppNameTableViewCell.self]
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "DVT App Showcase"
        self.appDetailTableView.delegate = self
        self.appDetailTableView.dataSource = self
        self.appDetailTableView.register(UINib.init(nibName: String(describing:AppNameTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing:AppNameTableViewCell.self))
        self.appDetailTableView.register(UINib.init(nibName: String(describing:AppDescriptionTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing:AppDescriptionTableViewCell.self))

      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    init() {
        super.init(nibName: String(describing: AppDetailViewController.self), bundle: nil)
        
    }
    
   convenience init(with dvtApp: [String: AnyObject?]) {
        self.init()
        selectedApp = dvtApp
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: TabelView Delegate Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let appNameCell = tableView.dequeueReusableCell(withIdentifier: String(describing:AppNameTableViewCell.self), for: indexPath) as! AppNameTableViewCell
            appNameCell.populateCell(with: selectedApp as [String : AnyObject])
            return appNameCell
        case 1:
            let appDescriptionCell = tableView.dequeueReusableCell(withIdentifier: String(describing:AppDescriptionTableViewCell.self), for: indexPath) as! AppDescriptionTableViewCell
            appDescriptionCell.populateCell(with: selectedApp as [String : AnyObject])
            return appDescriptionCell
        default:
            break
            
        }
       
        return UITableViewCell()
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // No need to implement didSelect
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return 150
        case 1:
            return 460
//        case 2:
//            return 460
        default:
            return 0
        }
    }
    
}



