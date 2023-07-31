import Foundation
import Firebase
import FirebaseDatabase



struct User {
    let ref: DatabaseReference?
    let key: String?
    let username: String?
    let email: String?
    let password: String?
    
    
    init(username: String?, email: String?, password: String?, key: String = "") {
        self.ref = nil
        self.key = key
        self.username = username
        self.email = email
        self.password = password
    }
    
    init?(snapshot: DataSnapshot){
        guard
            let value = snapshot.value as? [String: AnyObject],
            let username = value["username"] as? String,
            let email = value["email"] as? String,
            let password = value["password"] as? String
        else {
            return nil
        }
        
        self.ref = snapshot.ref
        self.key = snapshot.key
        self.username = username
        self.email = email
        self.password = password
    }
    
    
    
    func toAnyObject() ->Any {
        return [
            "username":username,
            "email": email,
            "password": password
        ]
    }
    
}
