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
    var newsDescriptions = CustomUILabel(title: "", fontSize: 10)
    var newsImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.gray
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 10
        contentView.clipsToBounds = true
        
        selectionStyle = UITableViewCell.SelectionStyle.none
        accessoryType = isSelected ? .checkmark : .none
        selectionStyle = .none
        
        addSubview(newsTitle)
        newsTitle.snp.makeConstraints {make in
            make.height.equalToSuperview().dividedBy(2.2)
            make.width.equalToSuperview().multipliedBy(0.6)
            make.left.equalToSuperview().offset(8)
            make.top.equalToSuperview().offset(8)
        }
        addSubview(newsDescriptions)
        newsDescriptions.snp.makeConstraints{make in
            make.top.equalTo(newsTitle.snp.bottom).offset(8)
            make.width.height.equalTo(newsTitle)
            make.left.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
        }
        addSubview(newsImage)
        newsImage.snp.makeConstraints{ make in
            make.left.equalTo(newsTitle.snp.right)
            make.right.equalToSuperview().offset(-8)
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


