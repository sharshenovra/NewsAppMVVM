//
//  MainController.swift
//  NewsAppMVVM
//
//  Created by Ruslan Sharshenov on 10.02.2022.
//

import Foundation
import UIKit
import SnapKit
import RealmSwift

class NewsController: UIViewController{
    
    private lazy var newsTableView = NewsTableView()
    
    private lazy var viewModel: NewsViewModel = {
        return NewsViewModel(delegate: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstraints()
        setupMainWindow()
        
        viewModel.getNews()
    }
    
    private func setupMainWindow() {
        view.backgroundColor = .black
    }
    
    func setupConstraints(){
        
        view.addSubview(newsTableView)
        newsTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeArea.top)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
}

extension NewsController: NewsDelegate {
    
    func showNews(model: [APIArticles]) {
        newsTableView.fill(models: model)
    }
}
