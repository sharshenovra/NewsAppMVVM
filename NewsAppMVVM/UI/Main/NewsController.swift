//
//  MainController.swift
//  NewsAppMVVM
//
//  Created by Ruslan Sharshenov on 10.02.2022.
//

import Foundation
import UIKit
import SnapKit

protocol NewsSelectDelegate: AnyObject{
    func selectNews(model: APIArticles)
}

class NewsController: UIViewController{
    
    private lazy var newsTableView = NewsTableView()
    
    private lazy var viewModel: NewsViewModel = {
        return NewsViewModel(delegate: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        setupConstraints()
        setupMainWindow()
        
        viewModel.getNews()
    }
    
    private func setupViews(){
        newsTableView.delegate = self
    }
    
    private func setupMainWindow() {
        view.backgroundColor = .black
    }
    
    func setupConstraints(){
        
        view.addSubview(newsTableView)
        newsTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeArea.top)
            make.width.equalToSuperview()
            make.bottom.equalTo(view.safeArea.bottom)
        }
    }
    
    
    
}

extension NewsController: NewsCellDelegate {
    func onClick(model: APIArticles){
        viewModel.selectNews(model: model)
        let vc = DetailController.newIntanse(delegate: self)
        vc.fillNews(title: model.title!, description: model.description!, urlToImage: model.urlToImage!)
        present(vc, animated: true)
    }
}

extension NewsController: NewsSelectDelegate{
    func selectNews(model: APIArticles) {
        viewModel.selectNews(model: model)
    }
}

extension NewsController: NewsDelegate {
    
    func showNews(model: [APIArticles]) {
        newsTableView.fill(models: model)
    }
}
