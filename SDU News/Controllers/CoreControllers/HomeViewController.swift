//
//  HomeViewController.swift
//  SDU News
//
//  Created by  Mukhammed Ali Khamzayev on 16.03.2023.
//

import Foundation
import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {
    
    
   
    
    private let timeIcon: UIImageView = {
       let imageView = UIImageView()
        
        return imageView
    }()
    
    private let trendingLabel: UILabel = {
       let label = UILabel()
        label.text = "Trending"
        label.textColor = UIColor(red: 9/255, green: 24/255, blue: 96/255, alpha: 1)
        label.font = UIFont(name: "Nunito-Bold", size: 16)
        return label
    }()
    
       

    private let seeAllButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("See all", for: .normal)
        button.tintColor = UIColor(red: 78/255, green: 75/255, blue: 102/255, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Nunito-Bold", size: 16)
        return button
    }()

    private let searchController: UISearchController = {
       let controller = UISearchController()
        controller.searchBar.placeholder = "Search"
        controller.searchBar.searchBarStyle = .minimal
        return controller
    }()
    
    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Click", for: .normal)
        button.tintColor = .black
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(button)
        view.addSubview(trendingLabel)
        view.addSubview(seeAllButton)
        view.addSubview(collectionViewSetup)
        collectionViewSetup.register(TrendingCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionViewSetup.delegate = self
        collectionViewSetup.dataSource = self
        button.addTarget(self, action: #selector(moveToSignIn), for: .touchUpInside)
        applyConstraints()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image:  UIImage(systemName: "rectangle.portrait.and.arrow.right"), style: .plain, target: self, action: #selector(signOutTapped))
        navbarConfiguration()
        navigationItem.searchController = searchController
      
       
    }
    
    
    
    let collectionViewSetup: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40 , height: 184)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 50
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 80, right: 0)
        //layout.minimumInteritemSpacing = 40
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.backgroundColor = .systemBackground
        return cv
    }()
    
    
    @objc private func signOutTapped() {
        try? Auth.auth().signOut()
        authenticationHandler()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        hidesBottomBarWhenPushed = false
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hidesBottomBarWhenPushed = true
        authenticationHandler()
    }
    
    
    private func authenticationHandler() {
        if Auth.auth().currentUser == nil {
            let vc = UINavigationController(rootViewController: PopUpViewController())
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }
    
    
    @objc private func moveToSignIn() {
            let vc = SignInViewController()
        navigationController?.pushViewController(vc, animated: true)
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
    
    
    private func applyConstraints()  {
        
        button.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        trendingLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.left.equalToSuperview().inset(22)
        }
        
        seeAllButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.right.equalToSuperview().inset(20)
        }
        
        collectionViewSetup.snp.makeConstraints {
            $0.top.equalTo(trendingLabel.snp.bottom).inset(-10)
            $0.left.equalToSuperview().inset(20)
            $0.right.equalToSuperview().inset(20)
            $0.width.equalTo(350)
            $0.height.equalTo(267)
        }
    }
    
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TrendingCollectionViewCell
        return cell
    }
    
    
    
    
    
   

    
    
}

















