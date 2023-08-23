//
//  NewsCollectionViewCell.swift
//  neoNews
//
//  Created by Али  on 24.08.2023.
//

import UIKit
import Kingfisher
import SnapKit

class NewsCell: UICollectionViewCell {
    
    static let identifier = "NewsCell"
    
    lazy private var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.crop.circle")
        image.sizeToFit()
        image.layer.cornerRadius = 16
        image.layer.masksToBounds = true
        return image
    }()
    
    lazy private var title: UILabel = {
        let label = UILabel()
        label.text = "Принцу Джорджу 10 лет: новое фото будущего короля Британии"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    lazy private var category: UILabel = {
        let label = UILabel()
        label.text = "Politics"
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = UIColor(red: 0.3, green: 0.35, blue: 0.72, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    
    lazy private var createdAt: UILabel = {
        let label = UILabel()
        label.text = "21.01.23"
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(image)
        addSubview(title)
        addSubview(category)
        addSubview(createdAt)
        backgroundColor = .red
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ news: News) {
        if let urlImage = news.image {
            image.kf.setImage(with: URL(string: urlImage))
        }
        
        
        title.text = news.title
    }
    func setupConstraints() {
        image.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.width.equalTo(121)
            make.top.bottom.equalToSuperview()
        }
        category.snp.makeConstraints { make in
            make.leading.equalTo(image.snp.trailing).offset(10)
            make.top.equalToSuperview()
        }
        title.snp.makeConstraints { make in
            make.top.equalTo(category.snp.bottom).offset(8)
            make.leading.equalTo(image.snp.trailing).offset(10)
            make.trailing.equalToSuperview()
        }
        
        createdAt.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalTo(image.snp.trailing).offset(10)

        }
    }
}
