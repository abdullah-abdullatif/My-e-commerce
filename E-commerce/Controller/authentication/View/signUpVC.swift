import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class signUpVC: UIViewController {
    
    let ref = Database.database().reference(withPath: "Users")
    
    @IBOutlet weak var txtUsername: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtCPassword: UITextField!
    @IBOutlet weak var btnSignUpOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnSignUpOutlet.layer.cornerRadius = 25.0
        
    }
    
    @IBAction func btnSignUp(_ sender: UIButton) {
        if (txtPassword.text == txtCPassword.text && txtPassword.text!.count > 6){
            
            let alert =  UIAlertController(title: "Register", message: "Create new account", preferredStyle: .alert)
            
            let savealert = UIAlertAction(title: "Save", style: .default) { _ in
                let username = self.txtUsername.text
                let email = self.txtEmail.text
                let pass = self.txtPassword.text
                
                Auth.auth().createUser(withEmail: email!, password: pass!) { user , error in
                    
                    if error == nil {
                        Auth.auth().signIn(withEmail: email!, password: pass!)
                        Auth.auth().addStateDidChangeListener { auth, user in
                            if(user != nil) {
                                self.reset()
                                self.goTo(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "successfulVC_ID") as! successfulVC)
                            }
                        }
                    }
                }
                
                
                
            }
            
            let cancelAlert = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(savealert)
            alert.addAction(cancelAlert)
            present(alert, animated: true , completion: nil)
            
            
            
        }else {
            txtCPassword.layer.borderWidth = 2
            txtCPassword.layer.borderColor = CGColor.init(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
        }
        
        
    }
    
    
    
    func reset() {
        txtUsername.text = ""
        txtEmail.text = ""
        txtPassword.text = ""
        txtCPassword.text = ""
    }
    
    
    
}




