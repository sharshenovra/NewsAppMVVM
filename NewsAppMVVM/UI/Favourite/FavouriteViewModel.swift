//
//  FavouriteViewModel.swift
//  NewsAppMVVM
//
//  Created by Ruslan Sharshenov on 12.02.2022.
//

import Foundation
import RealmSwift

class FavouriteViewModel {
    
    weak var delegate: FavouriteDelegate? = nil
    
    init(delegate: FavouriteDelegate) {
        self.delegate = delegate

    }
    
    func getFavourite() {
        if let news = DataBase.shared.getHistory() {
            delegate?.showFavouriteNews(model: news)
        }
    }
    
    func deleteAllFavourite() {
        DataBase.shared.deleteAllHistory()
    }
}
