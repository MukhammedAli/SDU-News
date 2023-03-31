//
//  ViewController.swift
//  SDU News
//
//  Created by  Mukhammed Ali Khamzayev on 17.02.2023.
//

import UIKit

class TabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
      
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: NewsViewController())
        let vc3 = UINavigationController(rootViewController: LostAndFoundViewController())
        let vc4 = UINavigationController(rootViewController: ProfileViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "newspaper")
        vc3.tabBarItem.image = UIImage(systemName: "globe")
        vc4.tabBarItem.image = UIImage(systemName: "person")
        
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }


}

