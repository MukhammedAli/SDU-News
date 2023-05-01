//
//  LostAndFoundCollectionViewCell.swift
//  SDU News
//
//  Created by  Mukhammed Ali Khamzayev on 01.04.2023.
//

import UIKit

class LostAndFoundCollectionViewCell: UICollectionViewCell {
    
    
    
    
    private let timeLabel: UILabel = {
       let label = UILabel()
        label.text = "4h ago"
        label.textColor = .secondaryLabel
        label.font = UIFont(name: "Nunito-Regular", size: 13)
        return label
    }()
    
    private let clockLogo: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "clocklogo")
        return imageView
        
    }()
    
    
    private let sourceLabel: UILabel = {
       let label = UILabel()
        label.text = "SDU KZ"
        label.font = UIFont(name: "Nunito-Bold", size: 13)
        label.textColor = UIColor(red: 9/255, green: 24/255, blue: 96/255, alpha: 1)
        return label
    }()
    
    private let newsTitle: UILabel = {
       let label = UILabel()
        label.text = "Meeting with the Rector today"
        label.font = UIFont(name: "Nunito-Regular", size: 16)
        label.textColor = .black
        return label
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "trendingnews")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    func setImage(imageNames: String) {
       imageView.image = UIImage(named: imageNames)
   }
   
    func setLabelName(labelText: String) {
       newsTitle.text = labelText
   }
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(sourceLabel)
        contentView.addSubview(newsTitle)
        contentView.addSubview(clockLogo)
        contentView.addSubview(timeLabel)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraints() {
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.right.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview()
        }
        
        sourceLabel.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.top.equalTo(imageView.snp.bottom).inset(-10)
        }
        
        newsTitle.snp.makeConstraints {
            $0.top.equalTo(sourceLabel.snp.bottom).inset(-4)
            $0.left.equalToSuperview()
        }
        
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(newsTitle.snp.bottom).inset(-4)
            $0.left.equalTo(clockLogo.snp.right).inset(-5)
        }
        
        clockLogo.snp.makeConstraints {
            $0.top.equalTo(newsTitle.snp.bottom).inset(-4)
            $0.left.equalToSuperview()
        }
        
        
    }
    
    
}
