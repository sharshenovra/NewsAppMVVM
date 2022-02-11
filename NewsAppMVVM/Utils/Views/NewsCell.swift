//
//  NewsCell.swift
//  NewsAppMVVM
//
//  Created by Ruslan Sharshenov on 10.02.2022.
//

import Foundation
import SnapKit
import Kingfisher

class NewsCell: UITableViewCell {
    
    var newsTitle = CustomUILabel(title: "", fontSize: 15)
    var newsDescriptions = CustomUILabel(title: "", fontSize: 15)
    var newsImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(newsTitle)
        backgroundColor = UIColor.darkGray
        newsTitle.snp.makeConstraints {make in
            make.height.equalToSuperview().dividedBy(2)
            make.width.equalToSuperview().multipliedBy(0.6)
            make.left.equalToSuperview()
        }
        addSubview(newsDescriptions)
        newsDescriptions.snp.makeConstraints{make in
            make.top.equalTo(newsTitle.snp.bottom)
            make.width.height.equalTo(newsTitle)
        }
        addSubview(newsImage)
        newsImage.snp.makeConstraints{ make in
            make.left.equalTo(newsTitle.snp.right)
            make.right.equalToSuperview()
            make.height.equalToSuperview().dividedBy(1.5)
            make.centerY.equalToSuperview()
        }
        configureImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImageView() {
        newsImage.layer.cornerRadius = 10
        newsImage.clipsToBounds = true
    }
    
    func fill(model: APIArticles) {
        newsTitle.text = model.title
        newsDescriptions.text = model.description
        newsImage.kf.setImage(with: URL(string: model.urlToImage!))
    }
    
}


