//
//  CustomUILabel.swift
//  NewsAppMVVM
//
//  Created by Ruslan Sharshenov on 10.02.2022.
//

import Foundation
import UIKit

class CustomUILabel: UILabel{
    
    init(title: String, fontSize: CGFloat) {
        super.init(frame: .zero)
        
        text = title
        textColor = .white
        textAlignment = .left
        font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setText(text: String) {
        self.text = text
    }
    
}
