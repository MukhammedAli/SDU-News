//
//  ClubsCollectionViewCell.swift
//  SDU News
//
//  Created by  Mukhammed Ali Khamzayev on 27.03.2023.
//

import UIKit
import SnapKit

class ClubsCollectionViewCell: UICollectionViewCell {
    
    private let clubsLogo: UIImageView = {
       let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 50
        return imageView
    }()
    
    
    private let clubName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Nunito-Regular", size: 16)
        label.textColor = UIColor(red: 9/255, green: 24/255, blue: 96/255, alpha: 1)
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
    }()
    
    private func configureConstraints() {
        clubsLogo.snp.makeConstraints {
            $0.width.height.equalTo(100)
            $0.top.left.equalToSuperview()
        }
        
        clubName.snp.makeConstraints {
            $0.top.equalTo(clubsLogo.snp.bottom).inset(-10)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            
        }
      
    }
    
    func setImage(imageNames: String) {
       clubsLogo.image = UIImage(named: imageNames)
   }
   
    func setClubName(labelText: String) {
       clubName.text = labelText
   }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(clubsLogo)
        contentView.addSubview(clubName)
        configureConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
  
    
}



