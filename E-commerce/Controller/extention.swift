import Foundation
import UIKit

extension UIViewController {
    func goTo (_ vc: UIViewController) {
        
        navigationController?.pushViewController(vc, animated: true)

    }
}
