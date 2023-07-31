import UIKit

class MainScreenVC: UIViewController {

   
    @IBOutlet weak var btnLoginOutlet: UIButton!
    
    @IBOutlet weak var btnSignUpOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)

        btnLoginOutlet.layer.cornerRadius =      25.0
        
        btnLoginOutlet.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)

        btnLoginOutlet.tintColor
        = UIColor.black
                
        
        btnSignUpOutlet.layer.cornerRadius =      25.0
        
        btnSignUpOutlet.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 0)

        btnSignUpOutlet.tintColor
        = UIColor.white
        
        btnSignUpOutlet.layer.borderWidth = 2
        btnSignUpOutlet.layer.borderColor = CGColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
    }
    

    @IBAction func btnLogin(_ sender: UIButton) {
        goTo(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginVC_ID") as! loginVC)
    }
    
    @IBAction func btnSignUp(_ sender: UIButton) {
        goTo(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "signUpVC_ID") as! signUpVC)
    }
    
}
