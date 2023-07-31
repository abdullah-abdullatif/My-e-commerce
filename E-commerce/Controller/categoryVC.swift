import UIKit
import SDWebImage

class categoryVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    let Manger = NetworkManger()
    var productsArr: [ProductElement] = []
    var selectedCategory: String = ""
    var filteredProductsArr: [ProductElement] = [] 

    @IBOutlet weak var categCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        categCollectionView.delegate = self
        categCollectionView.dataSource = self

        Manger.getData { Product in
            if let productData = Product {
                
                self.productsArr = productData
                self.filteredProductsArr = productData
                
                DispatchQueue.main.async {
                    self.categCollectionView.reloadData()
                }
                
            }
        }
    }

    // MARK: UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredProductsArr.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = categCollectionView.dequeueReusableCell(withReuseIdentifier: "CatmainCell", for: indexPath) as! categoryCollectionViewCell
        var img = URL(string: filteredProductsArr[indexPath.row].image)
        cell.imgCell.sd_setImage(with: img)
        cell.titleCell.text = filteredProductsArr[indexPath.row].title
        cell.priceCell.text = "$" + String(filteredProductsArr[indexPath.row].price)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 185, height: 275)
    }
    
    var count :Int = 0

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
  
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailedDataVC_ID") as! detailedDataVC
            
            navigationController?.pushViewController(vc, animated: true)
            
            vc.detailedData = filteredProductsArr[indexPath.row]
            count = indexPath.row

    }
    
    
    func filterProducts() {
        if selectedCategory.isEmpty {
            
            filteredProductsArr = productsArr
            
        } else {
            
            filteredProductsArr = productsArr.filter { $0.category.rawValue == selectedCategory }
            
        }
        categCollectionView.reloadData()
    }

    @IBAction func btnMen(_ sender: UIButton) {
        selectedCategory = "men's clothing"
        filterProducts()
    }

    @IBAction func btnWomen(_ sender: UIButton) {
        selectedCategory = "women's clothing"
        filterProducts()
    }

    @IBAction func btnElectronics(_ sender: UIButton) {
        selectedCategory = "electronics"
        filterProducts()
    }
    
    
    @IBAction func btnJewelery(_ sender: UIButton) {
        selectedCategory = "jewelery"
        filterProducts()
    }
    
    
    @IBAction func btncart(_ sender: Any) {
        guard count >= 0 && count < filteredProductsArr.count else {
            return
        }
        
        let selectedProduct = filteredProductsArr[count]
        

        
        
        if let cartVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "cartViewController_ID") as? cartViewController {
            cartVC.cartData = selectedProduct
            navigationController?.pushViewController(cartVC, animated: true)

            
        }
    }
    
}
