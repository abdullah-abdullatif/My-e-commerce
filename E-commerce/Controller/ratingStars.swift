import UIKit

class RatingStarsView: UIView {

    private let starSize: CGFloat = 20.0
    private let starSpacing: CGFloat = 4.0
    private var rating: Float = 0.0

    func setRating(_ rating: Float) {
        self.rating = max(0.0, min(5.0, rating))
        setNeedsDisplay()
    }

    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }

        let fullStarImage = UIImage(named: "fullStar")
        let emptyStarImage = UIImage(named: "emptyStar") 

        for i in 0..<5 {
            let starRect = CGRect(x: CGFloat(i) * (starSize + starSpacing), y: 0, width: starSize, height: starSize)
            let iFloat = Float(i)
            if iFloat < rating {
                fullStarImage?.draw(in: starRect)
            } else {
                emptyStarImage?.draw(in: starRect)
            }
        }
    }
}
