import Foundation



import UIKit
import SDWebImage

class homeVC: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

{

    let Manger = NetworkManger()
    var productsArr: [ProductElement] = []


    var adImgs = [UIImage(named: "features 1")!,UIImage(named: "features 2")! ]



    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
            case home1CollecView:
                return adImgs.count

            case home2CollecView:
                return productsArr.count
            default:
                return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {


        switch collectionView {
            case home1CollecView:
                let cell = home1CollecView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as! homeCollectionView1Cell

                cell.img.image = adImgs[indexPath.row]
                return cell

            case home2CollecView:
                let cell = home2CollecView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as! homeCollectionView2Cell
                var img = URL(string: productsArr[indexPath.row].image)
                cell.imgCell.sd_setImage(with: img)
                cell.titleCell.text = productsArr[indexPath.row].title
                cell.priceCell.text = "$" +  String(productsArr[indexPath.row].price)
                return cell

            default:
                return UICollectionViewCell()
        }

    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
            case home1CollecView:
            return CGSize(width: 260, height: 160)

            case home2CollecView:
            return CGSize(width: 185 , height: 280)

            default:
                return CGSize()
        }


    }

    var count :Int = 0
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailedDataVC_ID") as! detailedDataVC

            navigationController?.pushViewController(vc, animated: true)

            vc.detailedData = productsArr[indexPath.row]

            count = indexPath.row
    }



    @IBOutlet weak var home1CollecView: UICollectionView!

    @IBOutlet weak var home2CollecView: UICollectionView!


    override func viewDidLoad() {
        super.viewDidLoad()

        home1CollecView.delegate = self
        home1CollecView.dataSource = self

        home2CollecView.delegate = self
        home2CollecView.dataSource = self

        self.navigationItem.setHidesBackButton(true, animated: true)


        Manger.getData { Product in

            if let productData = Product{
                self.productsArr = productData
            }


            DispatchQueue.main.async {
                self.home2CollecView.reloadData()
            }
        }




    }


    @IBAction func btncart(_ sender: Any) {
        guard count >= 0 && count < productsArr.count else {
            return
        }
        
        let selectedProduct = productsArr[count]
        

        
        
        if let cartVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "cartViewController_ID") as? cartViewController {
            cartVC.cartData = selectedProduct
            navigationController?.pushViewController(cartVC, animated: true)

            
        }
    }




}
