
import UIKit

class AppNameTableViewCell: UITableViewCell {
    
    //Mark: Properties
    private var firebaseApi = FirebaseAPI.sharedFirebaseAPI

    @IBOutlet weak var appIcon: UIImageView!
    @IBOutlet weak var appName: UILabel!
    @IBOutlet weak var shortDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func populateCell(with dvtApp: [String: AnyObject]) {
        appName.text = dvtApp["name"] as? String
        shortDescription.text = dvtApp["shortDescription"] as? String
        firebaseApi.getIconImage(iconUrl: dvtApp["iconUrl"] as? String!) { (success, image, message) in
            if success {
                if let image = image {
                    self.appIcon.image = image
                }
                
            }
        }
    }
    
}
