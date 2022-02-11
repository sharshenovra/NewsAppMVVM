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
    
    weak var delegate: NewsDelegate? = nil
    
    weak var selectDelegate: NewsSelectDelegate? = nil
    
    weak var showDelegate: NewsShowDelegate? = nil
    
    init(delegate: NewsDelegate) {
        self.delegate = delegate

    }
    
    func selectNews(model: APIArticles){
        selectDelegate?.selectNews(model: model)
    }
    
func getNews() {
    if NewsAPI.shared.downloadNews(completed: { news in
        self.delegate?.showNews(model: news)
    }) != nil{
        
    }
    
}
    
}
