import UIKit

class Onboarding3VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    
    @IBAction func btnNext(_ sender: UIButton) {
        goTo(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainScreenVC_ID") as! MainScreenVC)
    }
    
}
