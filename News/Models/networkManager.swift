//
//  networkManager.swift
//  News
//
//  Created by Karan Gandhi on 4/8/21.
//

import Foundation


class networkManager : ObservableObject {
    
    
    let url = "https://hn.algolia.com/api/v1/search?tags=front_page"
    
   @Published var posts = [Post]()
   
    func fetchData(){
        
        
        
        
        
        guard let url = URL(string: url) else { return  }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            
            guard let data = data, error == nil else {return}
            
            print("Data Received")
            
            do{
                
                let result = try JSONDecoder().decode(Results.self, from : data)
                
                
                
                DispatchQueue.main.async {
                    self.posts = result.hits
                }
                
            }
            
            catch{
                
                print(error.localizedDescription)
            }
            
                

        
    }
        
        
        task.resume()
    }
}
