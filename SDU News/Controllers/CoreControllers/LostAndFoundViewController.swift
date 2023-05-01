//
//  ClubsViewController.swift
//  SDU News
//
//  Created by  Mukhammed Ali Khamzayev on 16.03.2023.
//

import Foundation
import UIKit

class LostAndFoundViewController: UIViewController {
    
    
    
    var newsTitle = ["I found airpods pro in lecture room",
    "I found the notebook acer in red canteen", "I found airpods pro in lecture room",
                     "I found the notebook acer in red canteen"]
    var images = ["imagelostfirst", "imagelostsecond","imagelostfirst", "imagelostsecond"]
   
    private enum SectionTabs: String {
        case lost = "Lost"
        case found = "Found"
        var index: Int {
            switch self {
            case .lost:
                return 0
            case .found:
                return 1
            }
        }
    }
    
    private var leadingAnchors: [NSLayoutConstraint] = []
    private var trailingAnchors: [NSLayoutConstraint] = []
    
    
    private let indicator: UIView  = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 9/255, green: 24/255, blue: 96/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var selectedTab: Int = 0 {
        didSet {
            for i in 0..<tabs.count {
                UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) { [weak self] in
                    self?.sectionStack.arrangedSubviews[i].tintColor = i == self?.selectedTab ? .label : .secondaryLabel
                    self?.leadingAnchors[i].isActive = i == self?.selectedTab ? true : false
                    self?.trailingAnchors[i].isActive = i == self?.selectedTab ? true : false
                    
                } completion: { _ in
                    
                }
                
                
            }
        }
    }
    
    private var tabs: [UIButton] = ["Lost", "Found"].map { buttonTitle in
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont(name: "Nunito-Regular", size: 16)
        button.tintColor = .label
        button.setTitle(buttonTitle, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    
    
    
    private lazy var sectionStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: tabs)
        stackView.distribution = .fillEqually
                stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let searchController: UISearchController = {
        let controller = UISearchController()
        controller.searchBar.placeholder = "Search"
        controller.searchBar.searchBarStyle = .minimal
        return controller
    }()
    
    private var navbarTitle: UILabel = {
        let label = UILabel()
        label.text = "Lost&Found"
        label.textColor = UIColor(red: 9/255, green: 24/255, blue: 96/255, alpha: 1)
        label.font = UIFont(name: "Poppins-Bold", size: 20)
        return label
    }()
    
    override func viewDidLoad() {
        navigationItem.titleView = navbarTitle
        navigationItem.searchController = searchController
        view.addSubview(sectionStack)
        view.addSubview(indicator)
       
        view.addSubview(collectionViewSetup)
        configureStackButtons()
        super.viewDidLoad()
        applyConstraints()
        collectionViewSetup.register(LostAndFoundCollectionViewCell.self, forCellWithReuseIdentifier: "cellLost")
        collectionViewSetup.delegate = self
        collectionViewSetup.dataSource = self
    }
    
    
    
    let collectionViewSetup: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40 , height: 184)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 100
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 80, right: 0)
        //layout.minimumInteritemSpacing = 40
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.backgroundColor = .systemBackground
        return cv
    }()
    
    private func configureStackButtons() {
        for (i, button) in sectionStack.arrangedSubviews.enumerated() {
            guard let button = button as? UIButton else {return}
            
            if i == selectedTab {
                button.tintColor = .label
            } else {
                button.tintColor = .secondaryLabel
            }
            button.addTarget(self, action: #selector(didTapTab(_ :)), for: .touchUpInside)
        }
    }
    
    @objc private func didTapTab(_ sender: UIButton) {
        print(sender.titleLabel?.text ?? "")
        guard let label = sender.titleLabel?.text else {return}
        
        switch label {
        case SectionTabs.lost.rawValue:
            selectedTab = 0
        case SectionTabs.found.rawValue:
            selectedTab = 1
        
        default:
            selectedTab = 0
        }
    }
    
    
    
    
    
    private func applyConstraints()  {
        for i in 0..<tabs.count {
            let leadingAnchor = indicator.leadingAnchor.constraint(equalTo: sectionStack.arrangedSubviews[i].leadingAnchor)
            leadingAnchors.append(leadingAnchor)
            let trailingAnchor = indicator.trailingAnchor.constraint(equalTo: sectionStack.arrangedSubviews[i].trailingAnchor)
            trailingAnchors.append(trailingAnchor)
        }
        
        collectionViewSetup.snp.makeConstraints {
            $0.top.equalTo(sectionStack.snp.bottom).inset(-20)
            $0.left.equalToSuperview().inset(20)
            $0.right.equalToSuperview().inset(20)
            $0.width.equalTo(350)
            $0.bottom.equalToSuperview()
        }
        
        
        sectionStack.snp.makeConstraints {
            $0.left.equalToSuperview().inset(20)
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.width.equalTo(130)
        }
        
        
        
        let indicatorConstraints = [
            leadingAnchors[0],
            trailingAnchors[0],
            indicator.topAnchor.constraint(equalTo: sectionStack.arrangedSubviews[0].bottomAnchor),
            indicator.heightAnchor.constraint(equalToConstant: 4)
        ]
        
        NSLayoutConstraint.activate(indicatorConstraints)
    }
}


extension LostAndFoundViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

            return 4
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
      
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellLost", for: indexPath) as! LostAndFoundCollectionViewCell
        cell.setLabelName(labelText: newsTitle[indexPath.row])
        cell.setImage(imageNames: images[indexPath.row])
            return cell
        
       
    }
}













