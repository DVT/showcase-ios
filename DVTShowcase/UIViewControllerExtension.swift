
import UIKit

extension UIViewController {
    
    // MARK: View Controller Presentation
    
    func push(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
