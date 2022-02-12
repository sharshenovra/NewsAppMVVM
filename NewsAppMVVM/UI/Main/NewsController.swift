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
    
    private lazy var newsTitle = CustomUILabel(title: "Новости", fontSize: 30)
    private lazy var favouriteButton = CustomButton(title: "Избранное")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        setupConstraints()
        setupMainWindow()
        
        viewModel.getNews()
    }
    
    private func setupViews(){
        newsTableView.delegate = self
        
        favouriteButton.setOnClickListener { view in
            self.present(FavouriteController(), animated: true)
        }
    }
    
    private func setupMainWindow() {
        view.backgroundColor = .darkGray
    }
    
    func setupConstraints(){
        
        view.addSubview(favouriteButton)
        favouriteButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeArea.top)
            make.right.equalTo(view.safeArea.right).offset(-16)
        }
        
        view.addSubview(newsTitle)
        newsTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeArea.top)
            make.left.equalTo(view.safeArea.left).offset(16)
        }
        
        view.addSubview(newsTableView)
        newsTableView.snp.makeConstraints { make in
            make.top.equalTo(newsTitle.snp.bottom)
            make.width.equalToSuperview()
            make.bottom.equalTo(view.safeArea.bottom)
        }
    }
    
    
    
}

extension NewsController: NewsCellDelegate {
    func onClick(model: APIArticles){
        viewModel.selectNews(model: model)
        let vc = DetailController.newIntanse(delegate: self)
        vc.fillNews(model: model)
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

