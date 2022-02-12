//
//  FavouriteTableView.swift
//  NewsAppMVVM
//
//  Created by Ruslan Sharshenov on 12.02.2022.
//

import Foundation
import UIKit
import SnapKit
import RealmSwift
import SwiftUI

class FavouriteTableView: UIView{

    private lazy var favouriteTableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = .darkGray
        view.register(FavouriteCell.self, forCellReuseIdentifier: "FavouriteCell")
        return view
    }()
    
    override func layoutSubviews() {
        backgroundColor = .darkGray
        
        addSubview(favouriteTableView)
        favouriteTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    private var models: Results<NewsModel>? = nil
    
    func fill(models: Results<NewsModel>) {
        self.models = models
        
        favouriteTableView.reloadData()
    }
    
    func reload(){
        favouriteTableView.reloadData()
    }
}

extension FavouriteTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favouriteTableView.dequeueReusableCell(withIdentifier: "FavouriteCell") as! FavouriteCell
        
        if let model = models?[indexPath.row] {
            cell.fill(model: model)
        }
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
