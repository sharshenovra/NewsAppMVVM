//
//  NewsAPIModel.swift
//  NewsAppMVVM
//
//  Created by Ruslan Sharshenov on 10.02.2022.
//

import Foundation

class NewsAPIModel: Codable {
    public var newsAPIList: [APIArticles] = []
 
    enum CodingKeys: String, CodingKey {
        case newsAPIList = "articles"
    }
}

class APIArticles: Codable {
    var title: String? = nil
    var description: String? = nil
    var urlToImage: String? = nil
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "description"
        case urlToImage = "urlToImage"
    }
}
