//
//  MainDetailsView.swift
//  SDU News
//
//  Created by  Mukhammed Ali Khamzayev on 30.04.2023.
//

import Foundation
import UIKit


class MainDetailsView: UIViewController {
    
    
    private var scrollView = UIScrollView()
    private var scrollContentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = navbarTitle
        view.addSubview(imageView)
        view.addSubview(sourceLabel)
        view.addSubview(newsTitle)
        configureConstraints()
    }
    
    private var navbarTitle: UILabel = {
        let label = UILabel()
        label.text = "Details"
        label.textColor = UIColor(red: 9/255, green: 24/255, blue: 96/255, alpha: 1)
        label.font = UIFont(name: "Poppins-Bold", size: 20)
        return label
    }()
    
    private var stackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fill
        view.alignment = .fill
        view.spacing = 16
        view.axis = .vertical
        return view
    }()
    
    private let imageMainView = UIView()
    private let textMainView = UIView()
    
    
    private func configureConstraints() {
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(150)
            $0.left.right.equalToSuperview().inset(10)
            $0.height.equalTo(250)
        }
        
        sourceLabel.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(10)
            $0.top.equalTo(imageView.snp.bottom).inset(10)
            
        }
        
        newsTitle.snp.makeConstraints {
            $0.top.equalTo(sourceLabel.snp.bottom).inset(-30)
            $0.left.right.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        }
        
        
        
    }
    
    private let newsTitle: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        label.font = UIFont(name: "Nunito-Regular", size: 16)
        label.textColor = .black
        return label
    }()
    
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "trendingnews")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        
        return imageView
    }()
    
    private let sourceLabel: UILabel = {
       let label = UILabel()
        label.text = "SDU KZ"
        label.numberOfLines = 0
        label.font = UIFont(name: "Nunito-Bold", size: 13)
        label.textColor = UIColor(red: 9/255, green: 24/255, blue: 96/255, alpha: 1)
        return label
    }()
    
    func configureCell(model: Articles) {
        sourceLabel.text = model.title
        newsTitle.text = model.description
        setImage(imageUrl: model.image_path)
    }
    
    func setImage(imageUrl: String?) {
        if let imageUrl = imageUrl, let url = URL(string: "http://185.125.88.33/images/\(imageUrl)") {
            imageView.load(url: url)
        } else {
            imageView.image = UIImage(named: "trendingnews")
        }
   }
}
