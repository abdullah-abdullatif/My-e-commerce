import UIKit
import SDWebImage

class detailedDataVC: UIViewController {

    
    var detailedData: ProductElement!
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var theTitle: UILabel!
    
    @IBOutlet weak var rateStarView: RatingStarsView!
    
    @IBOutlet weak var rateCount: UILabel!
    
    @IBOutlet weak var desc: UILabel!
    
    @IBOutlet weak var price: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        var the_img = URL(string: detailedData.image)
        self.img.sd_setImage(with: the_img)
        
        theTitle.text = detailedData.title
        
        
        let apiRating: Float = Float(detailedData.rating.rate)
                rateStarView.setRating(apiRating)
        
        rateCount.text = "( " + String(detailedData.rating.count) + " Review)"
        
        desc.text = detailedData.description
        
        price.text = "$" +  String(detailedData.price)
        
    }
    

    

}
