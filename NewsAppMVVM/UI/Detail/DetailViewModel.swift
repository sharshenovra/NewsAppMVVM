
import UIKit
import Foundation

protocol NewsShowDelegate: AnyObject{
    func fillNews(model: APIArticles)
}


class DetailViewModel{
    
    weak var delegate: NewsShowDelegate? = nil
    
    weak var selectDelegate: NewsSelectDelegate? = nil
    
    init(delegate: NewsShowDelegate){
        self.delegate = delegate
    }
    
}
