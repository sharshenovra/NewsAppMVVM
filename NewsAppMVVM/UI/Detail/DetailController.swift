//
//  DetailController.swift
//  NewsAppMVVM
//
//  Created by Ruslan Sharshenov on 10.02.2022.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher
import RealmSwift

class DetailController: UIViewController {

    private lazy var newsTitle = CustomUILabel(title: "", fontSize: 20)
    private lazy var newsDescription = CustomUILabel(title: "", fontSize: 20)
    private lazy var newsImage = UIImageView()
    private lazy var starButton = CustomButton(nameImage: "star", color: .yellow)
    
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

        setupConstraints()
    }
    
    private func setupMainWindow() {
        view.backgroundColor = .darkGray
    }
    
    private func setupViews() {
        
        let model = NewsModel.createNewsModel(newsTitle: "\(newsTitle.text!)", newsDescription: "\(newsDescription.text!)")
        
        if DataBase.shared.getHistory()?.contains(model) == false{
            starButton.tintColor = .yellow
        }else{
            starButton.tintColor = .red
        }
        
        starButton.setOnClickListener { view in
            if self.starButton.tintColor == .yellow{
                DataBase.shared.saveHistory(model: model)
                self.starButton.tintColor = .red
            }else{
              return
            }
        }
    }
    
    private func setupConstraints(){
        view.addSubview(newsTitle)
        newsTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeArea.top)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(view.frame.height / 8)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(starButton)
        starButton.snp.makeConstraints { make in
            make.top.equalTo(newsTitle.snp.bottom)
            make.right.equalToSuperview().offset(view.frame.width / -10)
            make.width.height.equalTo(view.frame.width / 10)
        }
        
        view.addSubview(newsDescription)
        newsDescription.snp.makeConstraints { make in
            make.top.equalTo(newsTitle.snp.bottom)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(view.frame.height / 3)
            make.centerX.equalToSuperview()
        }
        view.addSubview(newsImage)
        newsImage.snp.makeConstraints { make in
            make.top.equalTo(newsDescription.snp.bottom).offset(16)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(view.frame.width / 2.5)
            make.centerX.equalToSuperview()
        }
    }
}

extension DetailController: NewsShowDelegate{
    func fillNews(model: APIArticles){
        newsTitle.setText(text: model.title!)
        newsDescription.setText(text: model.description!)
        newsImage.kf.setImage(with: URL(string: model.urlToImage!))
    }
}
