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
    
    
    

    
    private enum SectionTabs: String {
        case all = "All"
        case faculty = "Faculty"
        case clubs = "Clubs"
        case events = "Events"
        
        
        
        var index: Int {
            switch self {
            case .all:
                return 0
            case .faculty:
                return 1
            case .clubs:
                return 2
            case .events:
                return 3
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
    
    
    private var tabs: [UIButton] = ["All", "Faculty", "Clubs", "Events"].map { buttonTitle in
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont(name: "Nunito-Regular", size: 16)
        button.tintColor = .label
        button.setTitle(buttonTitle, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    
    private lazy var sectionStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: tabs)
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
       return stackView
    }()
    
    var clubImages = ["shapagatclublogo", "eventclublogo","artclublogo","musicclublogo"]
    var clubNames = ["Shapagat Club", "Event Club", "Art Club", "Music Club"]
    
    private let timeIcon: UIImageView = {
       let imageView = UIImageView()
        
        return imageView
    }()
    
    private let newsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FavoriteTableViewCell.self, forCellReuseIdentifier: "cellnews")
        return tableView
    }()
    
    private let trendingLabel: UILabel = {
       let label = UILabel()
        label.text = "Trending"
        label.textColor = UIColor(red: 9/255, green: 24/255, blue: 96/255, alpha: 1)
        label.font = UIFont(name: "Nunito-Bold", size: 16)
        return label
    }()
    
    private let clubsLabel: UILabel = {
        let label = UILabel()
         label.text = "Clubs"
         label.textColor = UIColor(red: 9/255, green: 24/255, blue: 96/255, alpha: 1)
         label.font = UIFont(name: "Nunito-Bold", size: 16)
         return label
    }()
    
    private let latestLabel: UILabel = {
        let label = UILabel()
         label.text = "Latest"
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
    
    
    private let seeAllClubs: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("See all", for: .normal)
        button.tintColor = UIColor(red: 78/255, green: 75/255, blue: 102/255, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Nunito-Bold", size: 16)
        return button
    }()
    
    private let seeAllLatest: UIButton = {
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
    
  
    
    private let scrollView: UIScrollView = {
       let view = UIScrollView()
        view.frame = view.bounds
        view.contentSize = CGSize(width: view.frame.width, height: view.frame.height + 400)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let trendingView: UIView = {
       let view = UIView()
        return view
    }()
    
    private let clubsView: UIView = {
       let view = UIView()
        return view
    }()
    
    private let latestView: UIView = {
       let view = UIView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(trendingView)
        view.addSubview(clubsView)
        view.addSubview(latestView)
        view.addSubview(scrollView)
        view.addSubview(trendingLabel)
        view.addSubview(trendingLabel)
        view.addSubview(seeAllButton)
        view.addSubview(collectionViewSetup)
        view.addSubview(seeAllClubs)
        view.addSubview(clubsLabel)
        view.addSubview(clubsCollectionViewSetup)
        view.addSubview(latestLabel)
        view.addSubview(seeAllLatest)
        view.addSubview(sectionStack)
        view.addSubview(indicator)
        view.addSubview(newsTableView)
        collectionViewSetup.register(TrendingCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionViewSetup.delegate = self
        collectionViewSetup.dataSource = self
        
        clubsCollectionViewSetup.register(ClubsCollectionViewCell.self, forCellWithReuseIdentifier: "clubCell")
        clubsCollectionViewSetup.delegate = self
        clubsCollectionViewSetup.dataSource = self
        
        newsTableView.delegate = self
        newsTableView.dataSource = self
        applyConstraints()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image:  UIImage(systemName: "rectangle.portrait.and.arrow.right"), style: .plain, target: self, action: #selector(signOutTapped))
        navbarConfiguration()
        navigationItem.searchController = searchController
      configureStackButtons()
       
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
    
    let clubsCollectionViewSetup: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 15
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
        //layout.minimumInteritemSpacing = 40
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.backgroundColor = .systemBackground
        return cv
    }()
    
    
    @objc private func signOutTapped() {
        try? Auth.auth().signOut()
        authenticationHandler()
    }
    
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
        case SectionTabs.all.rawValue:
            selectedTab = 0
        case SectionTabs.faculty.rawValue:
            selectedTab = 1
        case SectionTabs.clubs.rawValue:
            selectedTab = 2
        case SectionTabs.events.rawValue:
            selectedTab = 3
        default:
            selectedTab = 0
        }
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
        
        for i in 0..<tabs.count {
            let leadingAnchor = indicator.leadingAnchor.constraint(equalTo: sectionStack.arrangedSubviews[i].leadingAnchor)
            leadingAnchors.append(leadingAnchor)
            let trailingAnchor = indicator.trailingAnchor.constraint(equalTo: sectionStack.arrangedSubviews[i].trailingAnchor)
            trailingAnchors.append(trailingAnchor)
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
        
        clubsLabel.snp.makeConstraints {
            $0.top.equalTo(collectionViewSetup.snp.bottom).inset(-21)
            $0.left.equalToSuperview().inset(20)
        }
        
        seeAllClubs.snp.makeConstraints {
            $0.top.equalTo(collectionViewSetup.snp.bottom).inset(-21)
            $0.right.equalToSuperview().inset(20)
        }
        
        clubsCollectionViewSetup.snp.makeConstraints {
            $0.top.equalTo(clubsLabel.snp.bottom).inset(-10)
            $0.left.equalToSuperview().inset(20)
            $0.right.equalToSuperview().inset(20)
            $0.width.equalTo(view.frame.width)
            $0.height.equalTo(164)
        }
        
        latestLabel.snp.makeConstraints {
            $0.top.equalTo(clubsCollectionViewSetup.snp.bottom).inset(-5)
            $0.left.equalToSuperview().inset(20)
        }
        
        seeAllLatest.snp.makeConstraints {
            $0.top.equalTo(clubsCollectionViewSetup.snp.bottom).inset(-5)
            $0.right.equalToSuperview().inset(20)
        }
        
        sectionStack.snp.makeConstraints {
            $0.left.equalToSuperview().inset(20)
            $0.top.equalTo(seeAllLatest.snp.bottom).inset(-11)
            $0.right.equalToSuperview().inset(96)
            
        }
        
        newsTableView.snp.makeConstraints {
            $0.width.equalTo(342)
            $0.top.equalTo(sectionStack.snp.bottom).inset(-30)
            $0.left.equalToSuperview().inset(25)
            $0.right.equalToSuperview().inset(23)
            $0.height.equalTo(500)
        }
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
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

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewSetup {
            return 3
        }
        else {
            return 4
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.collectionViewSetup {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TrendingCollectionViewCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "clubCell", for: indexPath) as! ClubsCollectionViewCell
            cell.setImage(imageNames: clubImages[indexPath.row])
            cell.setClubName(labelText: clubNames[indexPath.row])
            return cell
        }
       
    }
}



extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellnews") as? FavoriteTableViewCell
        else {return UITableViewCell()}
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        114
    }
    

}
















