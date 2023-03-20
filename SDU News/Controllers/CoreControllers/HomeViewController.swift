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
        button.addTarget(self, action: #selector(moveToSignIn), for: .touchUpInside)
        applyConstraints()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image:  UIImage(systemName: "rectangle.portrait.and.arrow.right"), style: .plain, target: self, action: #selector(signOutTapped))
       
    }
    
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
    
    private func applyConstraints()  {
        button.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
}
