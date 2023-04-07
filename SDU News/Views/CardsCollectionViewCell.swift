//
//  CardsCollectionViewCell.swift
//  SDU News
//
//  Created by  Mukhammed Ali Khamzayev on 06.04.2023.
//

import UIKit
import SnapKit


class CardsCollectionViewCell: UICollectionViewCell {
    
    private let clubsLogo: UIImageView = {
       let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 45
        return imageView
    }()
    
    
    private let clubName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Nunito-Regular", size: 10)
        label.textColor = UIColor(red: 9/255, green: 24/255, blue: 96/255, alpha: 1)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let clubButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Watch", for: .normal)
        button.titleLabel?.font = UIFont(name: "Nunito-Bold", size: 11)
        button.tintColor = UIColor(red: 24/255, green: 119/255, blue: 242/255, alpha: 1)
        button.backgroundColor = .clear
        button.layer.borderColor = UIColor(red: 24/255, green: 119/255, blue: 242/255, alpha: 1).cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 6
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(clubsLogo)
        contentView.addSubview(clubName)
        contentView.addSubview(clubButton)
        configureConstraints()
        contentView.backgroundColor = UIColor(red: 240/255, green: 238/255, blue: 238/255, alpha: 1)
        contentView.layer.cornerRadius = 10
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setImage(imageNames: String) {
       clubsLogo.image = UIImage(named: imageNames)
   }
   
    func setClubName(labelText: String) {
       clubName.text = labelText
   }
    
    
    private func configureConstraints() {
        
        clubsLogo.snp.makeConstraints {
            $0.top.equalToSuperview().inset(6)
            $0.left.right.equalToSuperview().inset(5)
            $0.width.equalTo(90)
            $0.height.equalTo(90)
        }
        
        clubName.snp.makeConstraints {
            $0.top.equalTo(clubsLogo.snp.bottom).inset(-6)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
        
        clubButton.snp.makeConstraints {
            $0.top.equalTo(clubName.snp.bottom).inset(-12)
            $0.left.equalToSuperview().inset(20)
            $0.right.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(6)
        }
    }
    
}


