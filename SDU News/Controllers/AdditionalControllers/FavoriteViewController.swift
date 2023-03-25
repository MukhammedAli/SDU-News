//
//  FavoriteViewController.swift
//  SDU News
//
//  Created by  Mukhammed Ali Khamzayev on 25.03.2023.
//

import Foundation
import SnapKit


class FavoriteViewController: UIViewController {
    
    
    private let favoriteTableView: UITableView = {
       let tableView = UITableView()
        tableView.register(FavoriteTableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private let favoriteLabel: UILabel = {
       let label = UILabel()
        label.text = "Favorite"
        label.font =  UIFont(name: "Nunito-Bold", size: 40)
        label.textColor = UIColor(red: 9/255, green: 24/255, blue: 96/255, alpha: 1)
        return label
    }()
    
    private let bookmarkLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bookmark")
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteTableView.delegate = self
        favoriteTableView.dataSource = self
        view.addSubview(favoriteLabel)
        view.addSubview(bookmarkLogo)
        view.addSubview(favoriteTableView)
        configureConstraints()
        navbarConfiguration()
    }
    
  
        private func navbarConfiguration() {
            let width: CGFloat = 125
            let height: CGFloat = 39
            let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
            logoImageView.contentMode = .scaleAspectFill
            logoImageView.image = UIImage(named: "SDUNewsIcon")
            let middleView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
            middleView.addSubview(logoImageView)
            navigationItem.titleView = middleView
            
        }
    
    
    private func configureConstraints() {
        favoriteLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(160)
            $0.left.equalToSuperview().inset(110)
        }
        
        bookmarkLogo.snp.makeConstraints {
            $0.left.equalTo(favoriteLabel.snp.right).inset(10)
            $0.top.equalToSuperview().inset(165)
        }
        
        favoriteTableView.snp.makeConstraints {
            $0.width.equalTo(342)
            $0.top.equalTo(favoriteLabel.snp.bottom).inset(-30)
            $0.left.equalToSuperview().inset(25)
            $0.right.equalToSuperview().inset(23)
            $0.height.equalTo(500)
        }
        
    }
    
    
}

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 114
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? FavoriteTableViewCell
        else {return UITableViewCell()}
        return cell
    }
    
    
    
    
}









