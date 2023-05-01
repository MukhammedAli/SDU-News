//
//  ClubsListViewController.swift
//  SDU News
//
//  Created by  Mukhammed Ali Khamzayev on 06.04.2023.
//

import UIKit

class ClubsListViewController: UIViewController {

    var clubImages = ["shapagatclublogo", "eventclublogo","artclublogo","shapagatclublogo", "eventclublogo","artclublogo","shapagatclublogo", "eventclublogo","artclublogo"]
    var clubNames = ["Shapagat Club", "Event Club", "Art Club","Shapagat Club", "Event Club", "Art Club","Shapagat Club", "Event Club", "Art Club"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = navbarTitle
        navigationItem.searchController = searchController
        searchResultsCollectionView.delegate = self
        searchResultsCollectionView.dataSource = self
        view.addSubview(searchResultsCollectionView)
        configureConstraints()
    }
    
    
    private var navbarTitle: UILabel = {
        let label = UILabel()
        label.text = "Clubs"
        label.textColor = .label
        label.font = UIFont(name: "Poppins-Bold", size: 20)
        return label
    }()
    
    private let searchController: UISearchController = {
        let controller = UISearchController()
        controller.searchBar.placeholder = "Search"
        controller.searchBar.searchBarStyle = .minimal
        return controller
    }()
    
    public let searchResultsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 160)
        layout.minimumInteritemSpacing  = 5
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CardsCollectionViewCell.self, forCellWithReuseIdentifier: "cardCell")
        return collectionView
    }()
    
    private func configureConstraints() {
        searchResultsCollectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(50)
            $0.left.equalToSuperview().inset(26)
            $0.right.equalToSuperview().inset(23)
            $0.width.equalTo(view.frame.width)
            $0.height.equalTo(view.frame.height)
        }
    }

}

extension ClubsListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ClubDetailsViewController()
        vc.setImage(imageNames: clubImages[indexPath.row])
        vc.setClubName(labelText: clubNames[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as? CardsCollectionViewCell else { return UICollectionViewCell() }
        cell.setImage(imageNames: clubImages[indexPath.row])
        cell.setClubName(labelText: clubNames[indexPath.row])
        
        return cell
    }
    
    
}
