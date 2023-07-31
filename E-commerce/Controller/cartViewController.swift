import UIKit
import SDWebImage

protocol CartViewControllerDelegate: AnyObject {
    func didAddToCart(_ cartData: ProductElement)
}


class cartViewController: UIViewController {
    
    var cartData: ProductElement!
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var the_title: UILabel!
    @IBOutlet weak var price: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let cartData = cartData else {
            
            print("Error")
            return
        }
        
        let imgURL = URL(string: cartData.image)
        img.sd_setImage(with: imgURL)
        
        the_title.text = cartData.title
        price.text = "$" + String(cartData.price)
    }
    
    
}
