//
//  DetailController.swift
//  NewsAppMVVM
//
//  Created by Ruslan Sharshenov on 10.02.2022.
//

import Foundation
import UIKit
import SnapKit

class DetailController: UIViewController {

    private lazy var newsTitle = CustomUILabel(title: "", fontSize: 20)
    private lazy var newsDescription = CustomUILabel(title: "", fontSize: 20)
    private lazy var newsImage = UIImageView()
    
    private lazy var viewModel: DetailViewModel = {
        return DetailViewModel(delegate: self)
    }()
    
    public static func newIntanse(delegate: NewsSelectDelegate) -> DetailController{
        let controller = DetailController()
        controller.viewModel.selectDelegate = delegate
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupMainWindow()
        setupViews()

    }
    
    private func setupMainWindow() {
        view.backgroundColor = .black
    }
    
    private func setupViews() {
        
        view.addSubview(newsTitle)
        newsTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeArea.top)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.centerX.equalToSuperview()
        }
        view.addSubview(newsDescription)
        newsDescription.snp.makeConstraints { make in
            make.top.equalTo(newsTitle.snp.bottom).offset(16)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.centerX.equalToSuperview()
        }
        view.addSubview(newsImage)
        newsImage.snp.makeConstraints { make in
            make.top.equalTo(newsDescription.snp.bottom).offset(16)
            make.width.equalToSuperview().multipliedBy(0.6)
            make.height.equalTo(view.frame.width * 0.6)
            make.bottom.equalToSuperview()
        }
    }
}

extension DetailController: NewsShowDelegate{
    func showNews(title: String, description: String){
        newsTitle.setText(text: title)
        newsDescription.setText(text: description)
    }
}
