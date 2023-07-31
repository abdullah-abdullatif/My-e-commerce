import UIKit
import Firebase
import FirebaseAuth

class loginVC: UIViewController {

    @IBOutlet weak var btnLoginOutlet: UIButton!
    
    @IBOutlet weak var btnFacebookOutlet: UIButton!
    
    @IBOutlet weak var btnGoogleOutlet: UIButton!
    
    @IBOutlet weak var btnAppleOutlet: UIButton!
    
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        btnLoginOutlet.layer.cornerRadius =      25.0
        btnFacebookOutlet.layer.cornerRadius =      25.0
        
        btnGoogleOutlet.layer.cornerRadius =      25.0
        btnGoogleOutlet.layer.borderWidth = 2
        btnGoogleOutlet.layer.borderColor = CGColor.init(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
        
        btnAppleOutlet.layer.cornerRadius =      25.0
        btnAppleOutlet.layer.borderWidth = 2
        btnAppleOutlet.layer.borderColor = CGColor.init(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
       
    }
    

    @IBAction func btnLogin(_ sender: UIButton) {
        
        guard
            let email = txtEmail.text,
            let pass = txtPassword.text,
                email.count > 0,
                pass.count > 0
        
        else{
            //messege lbl here
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: pass) { user, error in
            
            if let error = error , user == nil {
                let alert = UIAlertController(title: "Login", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default))
                self.present(alert, animated: true, completion: nil)
                
            }else{
                Auth.auth().addStateDidChangeListener { auth, error in
                    if user != nil {
                        UserDefaults.standard.setValue(email, forKey: "email")
                        UserDefaults.standard.setValue(pass, forKey: "password")
                        self.reset()
                        self.goTo(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabBarVC_ID") as! tabBarVC)
                    }
                }
            }
                
            
        }
        
        
        
        
    }
    
    
    
    @IBAction func btnGoogle(_ sender: Any) {
        
    }
    
    
    func reset() {
        txtEmail.text = ""
        txtPassword.text = ""
        
    }
    

}
