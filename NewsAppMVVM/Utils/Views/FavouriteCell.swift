//
//  FavouriteCell.swift
//  NewsAppMVVM
//
//  Created by Ruslan Sharshenov on 12.02.2022.
//

import Foundation
import UIKit
import SnapKit

class FavouriteCell: UITableViewCell {
    
    lazy var titleLabel = CustomUILabel(title: "", fontSize: 20)
    
    lazy var descriptionLabel = CustomUILabel(title: "", fontSize: 15)
    
    override func layoutSubviews() {
        backgroundColor = .gray
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
        }

        addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
        }
    }

    func fill(model: NewsModel) {
        titleLabel.text = model.newsTitle
        descriptionLabel.text = model.newsDescription
    }
}
