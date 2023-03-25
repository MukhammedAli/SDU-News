//
//  FavoriteTableViewCell.swift
//  SDU News
//
//  Created by  Mukhammed Ali Khamzayev on 25.03.2023.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    
    private let cellImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "favoriteimage")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let grantLabel: UILabel = {
       let label = UILabel()
        label.text = "Grant"
        label.font = UIFont(name: "Nunito-Bold", size: 13)
        return label
    }()
    
     private let textingLabel: UILabel = {
       let label = UILabel()
        label.text = "Special grants for you!Get involved as tsoon as possible"
        label.font = UIFont(name: "Nunito-Regular", size: 13)
         label.numberOfLines = 0
         label.textAlignment = .left
        return label
    }()
    
    private let newsType: UILabel = {
        let label = UILabel()
        label.text = "SDU Life"
        label.font = UIFont(name: "Poppins-Regular", size: 13)
         label.numberOfLines = 0
         label.textAlignment = .left
        return label
    }()
    
    private let newsTime: UILabel = {
        let label = UILabel()
        label.text = "14m ago"
        label.textColor = .secondaryLabel
        label.font = UIFont(name: "MontserratRoman-Regular", size: 13)
        return label
    }()
    
    private let clockLogo: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "clocklogo")
        return imageView
        
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cellImage)
        contentView.addSubview(grantLabel)
        contentView.addSubview(textingLabel)
        contentView.addSubview(newsType)
        contentView.addSubview(newsTime)
        contentView.addSubview(clockLogo)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func configureConstraints() {
        cellImage.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(100)
            $0.left.equalToSuperview().inset(5)
            $0.top.equalToSuperview().inset(5)
        }
        
        grantLabel.snp.makeConstraints {
            $0.left.equalTo(cellImage.snp.right).inset(-10)
            $0.top.equalToSuperview().inset(7)
        }
        
        textingLabel.snp.makeConstraints {
            $0.top.equalTo(grantLabel.snp.bottom).inset(-11)
            $0.left.equalTo(cellImage.snp.right).inset(-10)
        }
        
        newsType.snp.makeConstraints {
            $0.left.equalTo(cellImage.snp.right).inset(-10)
            $0.bottom.equalToSuperview().inset(6)
        }
        
        newsTime.snp.makeConstraints {
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview().inset(7)
        }
        
        clockLogo.snp.makeConstraints {
            $0.right.equalTo(newsTime.snp.left).inset(-5)
            $0.bottom.equalTo(newsTime.snp.bottom).inset(2)
        }
    }
    
    

}

