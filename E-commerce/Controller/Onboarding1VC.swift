import UIKit

class Onboarding1VC: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func btnNext(_ sender: UIButton) {
        goTo(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Onboarding2VC_ID") as! Onboarding2VC)
    }
    
 

}
