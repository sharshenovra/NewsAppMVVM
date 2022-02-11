
import UIKit
import Foundation

protocol NewsShowDelegate: AnyObject{
    func showNews(title: String, description: String, urlToImage: String)
}

class DetailViewModel{
    
    weak var delegate: NewsShowDelegate? = nil
    
    weak var selectDelegate: NewsSelectDelegate? = nil
    
    init(delegate: NewsShowDelegate){
        self.delegate = delegate
    }
    
    func selectNews(model: APIArticles){
        delegate?.showNews(title: model.title!, description: model.description!, urlToImage: model.urlToImage!)
    }
}
