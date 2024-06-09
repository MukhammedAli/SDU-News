//
//  TrendingListViewController.swift
//  SDU News
//
//  Created by  Mukhammed Ali Khamzayev on 13.04.2023.
//

import UIKit
import Alamofire

class TrendingListViewController: UIViewController {

//    private var newsArray: [Articles] = []
//    private var clubsArray: [Categories] = []
//
//
   private var images: [Articles] = []
    var titles = ["Meeting with rector today"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = navbarTitle
        view.addSubview(collectionViewSetup)
        applyConstraints()
        collectionViewSetup.register(TrendingListCollectionViewCell.self, forCellWithReuseIdentifier: "cellTrendingList")
        collectionViewSetup.delegate = self
        collectionViewSetup.dataSource = self
      //  getArticles()
        // Do any additional setup after loading the view.
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
    
    private func applyConstraints() {
        collectionViewSetup.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.left.equalToSuperview().inset(20)
            $0.right.equalToSuperview().inset(20)
            $0.width.equalTo(350)
            $0.bottom.equalToSuperview()
        }
    }
    
    private var navbarTitle: UILabel = {
        let label = UILabel()
        label.text = "Trending"
        label.textColor = UIColor(red: 9/255, green: 24/255, blue: 96/255, alpha: 1)
        label.font = UIFont(name: "Poppins-Bold", size: 20)
        return label
    }()
    
 
    

}





extension TrendingListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return images.count
        
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = MainDetailsView()
        vc.configureCell(model: images[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TrendingCollectionViewCell
//        cell.configureCell(model: newsArray[indexPath.row])
      
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellTrendingList", for: indexPath) as! TrendingListCollectionViewCell
        cell.configureCell(model: images[indexPath.row])
            return cell
        
       
    }
}


extension TrendingListViewController {
//    func getCategories() {
//        AF.request("http://185.125.88.33/categories/")
//            .validate()
//            .responseDecodable(of: [Categories].self) { (response) in
//                switch response.result {
//                case .success(let model):
//                    print(model)
//                    let categories = model.filter { category in
//                        category.parent_id == 2
//                    }
//                    self.images = categories
//                    DispatchQueue.main.async {
//                        self.collectionViewSetup.reloadData()
//                    }
//                case .failure(let error):
//                    print(error)
//                }
//            }
//    }
    
    func getArticles() {
//        AF.request("http://185.125.88.33/articles/")
//            .validate()
//            .responseDecodable(of: [Articles].self) { (response) in
//                switch response.result {
//                case .success(let model):
//                    print(model)
//                    self.images = model
//                    DispatchQueue.main.async {
//                        self.collectionViewSetup.reloadData()
//                    }
//                case .failure(let error):
//                    print(error)
//                }
//            }
    }
}







