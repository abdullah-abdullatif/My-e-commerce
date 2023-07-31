import UIKit

class successfulVC: UIViewController {
    @IBOutlet weak var btnStart: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated: true)
        
        btnStart.layer.cornerRadius =  25.0
    }
    
    @IBAction func btnStart(_ sender: UIButton) {
        
        goTo(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabBarVC_ID") as! tabBarVC)
    }
    
    

}
