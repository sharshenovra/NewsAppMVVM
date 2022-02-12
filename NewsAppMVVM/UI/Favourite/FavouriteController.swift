//
//  FavouriteController.swift
//  NewsAppMVVM
//
//  Created by Ruslan Sharshenov on 12.02.2022.
//

import Foundation
import UIKit
import SnapKit
import RealmSwift

class FavouriteController: UIViewController{
    
    private lazy var favouriteTableView = FavouriteTableView()
    
    private lazy var clearButton = CustomButton(title: "Clear all")
    
    private lazy var viewModel: FavouriteViewModel = {
        return FavouriteViewModel(delegate: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstraints()
        setupMainWindow()
        setupViews()
        
        viewModel.getFavourite()
    }
    
    private func setupMainWindow() {
        view.backgroundColor = .darkGray
    }
    
    func setupViews(){
        
        clearButton.setOnClickListener { view in
            self.viewModel.deleteAllFavourite()
            self.favouriteTableView.reload()
        }
    }
    
    func setupConstraints(){
        view.addSubview(clearButton)
        clearButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeArea.top).offset(8)
            make.right.equalToSuperview().offset(-8)
        }
        
        view.addSubview(favouriteTableView)
        favouriteTableView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalTo(clearButton.snp.bottom)
            make.bottom.equalToSuperview()
        }
    }
    
}

extension FavouriteController: FavouriteDelegate {
    func showFavouriteNews(model: Results<NewsModel>) {
        favouriteTableView.fill(models: model)
    }
}
