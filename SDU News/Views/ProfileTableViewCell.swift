//
//  ProfileTableViewCell.swift
//  SDU News
//
//  Created by  Mukhammed Ali Khamzayev on 22.03.2023.
//

import UIKit




class ProfileTableViewCell: UITableViewCell {

    
    
    private func addBorder() {
        let thickness: CGFloat = 2.0
         let bottomBorder = CALayer()
         bottomBorder.frame = CGRect(x:0, y: self.contentView.frame.size.height, width: self.contentView.frame.size.width, height:thickness)
        bottomBorder.backgroundColor = UIColor.white.cgColor
        contentView.layer.addSublayer(bottomBorder)
    }
    
    private let leftIconImage: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
       return imageView
    }()
    
    private let aboveLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "MontserratRoman-Regular", size: 20)
        label.textColor = .white
        return label
    }()
    
    private let belowLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "MontserratRoman-Regular", size: 8)
        label.textColor = .white
        return label
    }()
    
    private let arrow: UIImageView = {
       let imageView = UIImageView()
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        contentView.addSubview(leftIconImage)
        contentView.addSubview(aboveLabel)
        contentView.addSubview(belowLabel)
        contentView.addSubview(arrow)
        addBorder()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureConstraints() {
        leftIconImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalTo(5)
            $0.height.equalTo(35)
            $0.width.equalTo(35)
        }
        
        aboveLabel.snp.makeConstraints {
            $0.left.equalTo(leftIconImage.snp.right).inset(-27)
            $0.top.equalToSuperview().inset(5)
        }
        
        belowLabel.snp.makeConstraints {
            $0.left.equalTo(leftIconImage.snp.right).inset(-27)
            $0.top.equalTo(aboveLabel.snp.bottom).inset(-5)
        }
        
        arrow.snp.makeConstraints {
            $0.right.equalToSuperview()
            $0.top.equalToSuperview().inset(5)
        }
    }
    
     func setImage(imageNames: String) {
        leftIconImage.image = UIImage(named: imageNames)
    }
    
     func setAboveLabel(labelText: String) {
        aboveLabel.text = labelText
    }
    
     func setBelowLabel(labelText: String) {
        belowLabel.text = labelText
    }
    
    func setArrow(arrowName: String) {
        arrow.image = UIImage(named: arrowName)
    }
}


