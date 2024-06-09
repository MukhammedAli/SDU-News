//
//  HomeViewController.swift
//  SDU News
//
//  Created by  Mukhammed Ali Khamzayev on 16.03.2023.
//

import Foundation
import UIKit
import FirebaseAuth
import Alamofire

class HomeViewController: UIViewController {
    
    
    private var newsArray: [Articles] = []
    private var clubsArray: [Categories] = []

    
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
    
    
    
    private let trendingView: UIView = {
       let view = UIView()
        
        return view
    }()
    
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
        tableView.isScrollEnabled = false
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
    
    private var scrollView = UIScrollView()
    private var scrollContentView = UIView()
    
    private var stackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fill
        view.alignment = .fill
        view.spacing = 16
        view.axis = .vertical
        return view
    }()
    
    private let trendingMainView = UIView()
    private let clubsMainView = UIView()
    private let latestMainView = UIView()
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.addSubview(scrollContentView)
        scrollContentView.addSubview(stackView)
        scrollView.alwaysBounceVertical = true
        
        trendingMainView.addSubview(trendingLabel)
        trendingMainView.addSubview(seeAllButton)
        trendingMainView.addSubview(collectionViewSetup)
        clubsMainView.addSubview(clubsLabel)
        clubsMainView.addSubview(clubsCollectionViewSetup)
        clubsMainView.addSubview(seeAllClubs)
        latestMainView.addSubview(latestLabel)
        latestMainView.addSubview(seeAllLatest)
        latestMainView.addSubview(sectionStack)
        latestMainView.addSubview(indicator)
        latestMainView.addSubview(newsTableView)
        
        stackView.addArrangedSubview(trendingMainView)
        stackView.addArrangedSubview(clubsMainView)
        stackView.addArrangedSubview(latestMainView)
        
        view.backgroundColor = .systemBackground
        scrollView.isScrollEnabled = true
        actionTrending()
        actionClubs()
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
        getCategories()
        getArticles()
    }
    
    private func actionTrending() {
        seeAllButton.addTarget(self, action: #selector(moveToTrending), for: .touchUpInside)
    }
    
     private func actionClubs() {
        seeAllClubs.addTarget(self, action: #selector(moveToClubList), for: .touchUpInside)
    }
    
    @objc private func moveToTrending() {
        navigationController?.pushViewController(TrendingListViewController(), animated: true)
    }
    
    @objc private func moveToClubList() {
        navigationController?.pushViewController(ClubsListViewController(), animated: true)
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
       // authenticationHandler()
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

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

      //  authenticationHandler()
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
        
        scrollView.snp.makeConstraints { (m) in
            m.edges.equalToSuperview()
        }
        
        scrollContentView.snp.makeConstraints { (m) in
            m.top.equalToSuperview()
            m.leading.trailing.bottom.equalToSuperview()
            m.width.equalTo(scrollView.snp.width)
        }
        
        stackView.snp.makeConstraints { (m) in
            m.top.equalToSuperview().offset(16)
            m.left.equalToSuperview().offset(20)
            m.right.equalToSuperview().offset(-20)
            m.bottom.equalToSuperview().offset(-16)
        }
        
        trendingMainView.snp.makeConstraints {
            $0.height.equalTo(300)
//            $0.top.equalTo(view.safeAreaLayoutGuide)
//            $0.left.equalToSuperview().inset(22)
//            $0.right.equalToSuperview().inset(20)
//            $0.bottom.equalTo(collectionViewSetup.snp.bottom).inset(-15)
        }
        
        trendingLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
        }
        
        seeAllButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.right.equalToSuperview()
        }
        
        collectionViewSetup.snp.makeConstraints {
            $0.top.equalTo(trendingLabel.snp.bottom).inset(-10)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.width.equalTo(350)
            $0.height.equalTo(267)
        }
        
        clubsMainView.snp.makeConstraints {
//            $0.top.equalTo(trendingMainView.snp.bottom).inset(-21)
//            $0.left.equalToSuperview().inset(20)
//            $0.right.equalToSuperview().inset(20)
//            $0.bottom.equalTo(clubsCollectionViewSetup.snp.bottom).inset(-5)
            $0.height.equalTo(200)
        }
        
        clubsLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
        }
        
        seeAllClubs.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.right.equalToSuperview()
        }
        
        clubsCollectionViewSetup.snp.makeConstraints {
            $0.top.equalTo(clubsLabel.snp.bottom).inset(-10)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.width.equalTo(view.frame.width)
            $0.height.equalTo(164)
        }
        
        
        latestMainView.snp.makeConstraints {
//            $0.top.equalTo(clubsMainView.snp.bottom).inset(-5)
//            $0.left.equalToSuperview().inset(20)
//            $0.right.equalToSuperview().inset(20)
            $0.height.equalTo(114 * 5 + 70)
        }
        
        latestLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
        }
        
        seeAllLatest.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.right.equalToSuperview()
        }
        
        sectionStack.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.top.equalTo(seeAllLatest.snp.bottom).inset(-5)
            $0.right.equalToSuperview()
            
        }
        
        newsTableView.snp.makeConstraints {
            $0.width.equalTo(342)
            $0.top.equalTo(sectionStack.snp.bottom).inset(-10)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.height.equalTo(114 * 5)
            $0.bottom.equalToSuperview()
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
            return newsArray.count
        }
        else {
            return clubsArray.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.collectionViewSetup {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TrendingCollectionViewCell
            cell.configureCell(model: newsArray[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "clubCell", for: indexPath) as! ClubsCollectionViewCell
            cell.setImage(imageUrl: clubsArray[indexPath.row].image_path)
            cell.setClubName(labelText: clubsArray[indexPath.row].name)
            return cell
        }
       
    }
}



extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
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

// MARK: - Networking
extension HomeViewController {
    func getCategories() {
        AF.request("http://185.125.88.33/categories/")
            .validate()
            .responseDecodable(of: [Categories].self) { (response) in
                switch response.result {
                case .success(let model):
                    print(model)
                    let categories = model.filter { category in
                        category.parent_id == 2
                    }
                    self.clubsArray = categories
                    DispatchQueue.main.async {
                        self.clubsCollectionViewSetup.reloadData()
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func getArticles() {
        AF.request("http://185.125.88.33/articles/")
            .validate()
            .responseDecodable(of: [Articles].self) { (response) in
                switch response.result {
                case .success(let model):
                    print(model)
                    self.newsArray = model
                    DispatchQueue.main.async {
                        self.collectionViewSetup.reloadData()
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
}

struct Categories: Decodable {
    var id: Int?
    var parent_id: Int?
    var name: String?
    var description: String?
    var image_path: String?
}

struct Articles: Decodable {
    var id: Int?
    var likes: Int?
    var views: Int?
    var is_events: Bool?
    var comments_count: Int?
    var created_at: String?
    var category_name: String?
    var user_first_name: String?
    var user_last_name: String?
    var title: String?
    var description: String?
    var image_path: String?
}






