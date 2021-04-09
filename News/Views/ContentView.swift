//
//  ContentView.swift
//  News
//
//  Created by Karan Gandhi on 4/8/21.
//

import SwiftUI

struct ContentView: View {
    
    
    @ObservedObject var NetworkManager = networkManager()
    
    var body: some View {
        
        NavigationView {
            
            List(NetworkManager.posts) {
                posts in
                NavigationLink(
                    destination: DetailView(url: posts.url),
                    label: {
                        HStack{
                            Text(String(posts.points))
         
                            Text(posts.title)
                        }

                    })
                
                
                              
                
                
           
        }
    
            .navigationBarTitle("Hacker News")
        
    }
        
        .onAppear(perform: {
            self.NetworkManager.fetchData()
        })
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





//
//let posts = [
//
//Post(id: "1", title: "Hello"),
//Post(id: "2", title: "Bonjour"),
//Post(id: "3", title: "Hello")
//
//]
