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

protocol FavouriteDelegate: AnyObject {
    func showFavouriteNews(model: Results<NewsModel>)
}

class NewsViewModel {
    
    weak var delegate: NewsDelegate? = nil
    
    weak var selectDelegate: NewsSelectDelegate? = nil
    
    weak var showDelegate: NewsShowDelegate? = nil
    
    weak var favDelegate: FavouriteDelegate? = nil
    
    init(delegate: NewsDelegate) {
        self.delegate = delegate

    }
    
    func selectNews(model: APIArticles){
        selectDelegate?.selectNews(model: model)
    }
    
    func getNews() {
    NewsAPI.shared.downloadNews { array in
        self.delegate?.showNews(model: array)
    }
}
    
}
