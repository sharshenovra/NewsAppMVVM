//
//  NewsAPI.swift
//  NewsAppMVVM
//
//  Created by Ruslan Sharshenov on 10.02.2022.
//

import Foundation
import SwiftUI

class NewsAPI{
    
   static let shared = NewsAPI()
    
    func downloadNews(completed: @escaping([APIArticles]) -> ()) {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?language=ru&apiKey=37c24cd29815413593bb9c9c942cd59f")
        
        URLSession.shared.dataTask(with: url!) { (data, urlResponse, error) in
            if error == nil {
                do {
                    var response = try JSONDecoder().decode(NewsAPIModel.self, from: data!)
                    DispatchQueue.main.async {
                        completed(response.newsAPIList)
                    }
                } catch {
                    print("JSON Error")
                }
            }
        }.resume()
        
    }
    
}
