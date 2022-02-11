//
//  MainViewModel.swift
//  NewsAppMVVM
//
//  Created by Ruslan Sharshenov on 10.02.2022.
//

import Foundation
import RealmSwift

protocol NewsDelegate: AnyObject {
    func showNews(model: [APIArticles])
}


class NewsViewModel {
    
    weak var newsDelegate: NewsDelegate? = nil
    
    init(delegate: NewsDelegate) {
        self.newsDelegate = delegate

    }

func getNews() {
    if NewsAPI.shared.downloadNews(completed: { news in
        self.newsDelegate?.showNews(model: news)
    }) != nil{
        
    }
    
}
    
}
