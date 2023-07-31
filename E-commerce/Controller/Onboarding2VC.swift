import UIKit

class Onboarding2VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated: true)

    }
    
    @IBAction func btnNext(_ sender: UIButton) {
        goTo(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Onboarding3VC_ID") as! Onboarding3VC)
    }
    


}
