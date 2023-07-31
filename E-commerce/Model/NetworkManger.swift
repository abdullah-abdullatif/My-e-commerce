import Foundation

class NetworkManger{
    
    func getData(completion: @escaping(_ products: Product?)-> Void)  {
                
        let url = URL(string:"https://fakestoreapi.com/products") // 1- url
        
        let req = URLRequest(url: url!)  // 2- request
        
        let session = URLSession(configuration:   URLSessionConfiguration.default) // 3- session
        
        let task = session.dataTask(with: req) {
            (data , response , error) in
            guard let safeData = data else{return}
            
            completion(self.parsJson(the_data: safeData))
            
        } // 4- create task
        
        task.resume()  // 5- start task
        
    }





    private func parsJson (the_data: Data) -> Product? {
        do {
            let decoder = JSONDecoder()
            
            let decodedData = try decoder.decode(Product.self, from: the_data)
            
            return decodedData
            
        }catch {
            
            return nil
        }
    }

}
