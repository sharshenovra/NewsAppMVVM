//
//  NewsModel.swift
//  NewsAppMVVM
//
//  Created by Ruslan Sharshenov on 10.02.2022.
//

import Foundation
import RealmSwift

class NewsModel: Object {
    @objc dynamic var newsTitle = ""
    @objc dynamic var newsDescription = ""
    
    static func createNewsModel(newsTitle: String, newsDescription: String) -> NewsModel {
        let model = NewsModel()
        model.newsTitle = newsTitle
        model.newsDescription = newsDescription
        return model
    }
}

