
import UIKit

extension UIViewController {
    
    // MARK: - View Controller Presentation
    
    func present(viewController: UIViewController, withTransition: Bool = false) {
        let closeButton = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(dismissPresentedViewController))
        viewController.navigationItem.leftBarButtonItem = closeButton
        let navigationController = UINavigationController(rootViewController: viewController)
        present(navigationController: navigationController)
    }
    
    private func present(navigationController: UINavigationController) {
        navigationController.modalPresentationStyle = .formSheet
        navigationController.modalTransitionStyle = .coverVertical
        present(navigationController, animated: true, completion: nil)
    }
    @objc func dismissPresentedViewController() {
            dismiss(animated: true, completion: nil)
    }
}
