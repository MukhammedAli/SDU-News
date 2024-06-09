//
//  TableViewCell.swift
//  RandomCharacterApp
//
//  Created by  Mukhammed Ali Khamzayev on 05.09.2023.
//

import UIKit
import SnapKit

class CustomCellOne: UITableViewCell {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Факты обо мне"
        label.textColor = .secondaryLabel
        label.font = UIFont(name: "MontserratRoman-Regular", size: 13)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        configureConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraints() {
        titleLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(-20)
            $0.top.equalToSuperview().inset(-20)
            $0.bottom.equalToSuperview()
            $0.right.equalToSuperview()
        }
    }
    
    
    
    
    
}

