//
//  NewsTableView.swift
//  NewsAppMVVM
//
//  Created by Ruslan Sharshenov on 10.02.2022.
//

import Foundation
import RealmSwift
import SnapKit

protocol NewsCellDelegate: AnyObject{
    func onClick(model: APIArticles)
}

class NewsTableView: UIView{

    private lazy var newsTableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = .black
        view.register(NewsCell.self, forCellReuseIdentifier: "NewsCell")
        return view
    }()
    
    weak var delegate: NewsCellDelegate? = nil
    
    override func layoutSubviews() {
        addSubview(newsTableView)
        newsTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    private var models: [APIArticles]?
    
    func fill(models: [APIArticles]) {
        self.models = models
        newsTableView.reloadData()
    }
}

extension NewsTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let model = models?[indexPath.row]{
            delegate?.onClick(model: model)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTableView.dequeueReusableCell(withIdentifier: "NewsCell") as! NewsCell

        if let model = models?[indexPath.row] {
            cell.fill(model: model)
        }
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160 
    }
}
