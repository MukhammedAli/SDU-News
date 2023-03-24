//
//  ProfileViewController.swift
//  SDU News
//
//  Created by  Mukhammed Ali Khamzayev on 16.03.2023.
//

import Foundation
import UIKit
import SnapKit



 



struct arrayOfTableView {
    static var arrayOfImages: [String] = ["userlogo","saveicon", "noteicon", "helpicon", "settingsicon"]
    static var arrayOfAboveLabels: [String] = ["Login Details",
    "Favorite News", "My News", "Help", "Settings"]
    
    static var arrayOfBelowLabels: [String] = ["User Name,Password",
    "Language, Appearance", "Here's all your news", "FAQ's, Help Desk","Language, Appearance"]
}

class ProfileViewController: UIViewController {
    
    
    private let tableViewOfProfile: UITableView = {
       let tableView = UITableView()
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .clear
       return tableView
    }()
    
    
    private let profileLabel: UILabel = {
        let label = UILabel()
        label.text = "Profile"
        label.font = UIFont(name: "MontserratRoman-Regular", size: 32)
        label.textColor = .white
        return label
    }()
    
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "kuanysh")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 30
        return imageView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.hidesBottomBarWhenPushed = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.hidesBottomBarWhenPushed = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundImageOverlay")!)
        view.addSubview(profileLabel)
        view.addSubview(profileImage)
        view.addSubview(tableViewOfProfile)
        tableViewOfProfile.delegate = self
        tableViewOfProfile.dataSource = self
        configureConstraints()
        
    }
    
    private func configureConstraints() {
        profileLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(70)
            $0.centerX.equalToSuperview()
        }
        
        profileImage.snp.makeConstraints {
            $0.top.equalTo(profileLabel.snp.bottom).inset(-41)
            $0.centerX.equalToSuperview()
        }
        tableViewOfProfile.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).inset(-54)
            $0.left.equalToSuperview().inset(60)
            $0.right.equalToSuperview().inset(40)
            $0.width.equalTo(310)
            $0.height.equalTo(330)
            
        }
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
            case 0:
            profileTableViewCellDidTapLogin()
            case 1:
            profileTableViewCellDidTapFavorite()
            case 2:
            profileTableViewCellDidTapMyNews()
            case 3:
            profileTableViewCellDidTapHelp()
            case 4:
            profileTableViewCellDidTapSettings()
        default:
            print("Done")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ProfileTableViewCell else {return UITableViewCell()}
        cell.backgroundColor = .clear
        cell.setArrow(arrowName: "arrowicon")
        cell.setImage(imageNames: arrayOfTableView.arrayOfImages[indexPath.row])
        cell.setAboveLabel(labelText: arrayOfTableView.arrayOfAboveLabels[indexPath.row])
        cell.setBelowLabel(labelText: arrayOfTableView.arrayOfBelowLabels[indexPath.row])
        return cell
    }
    
    
    
    func profileTableViewCellDidTapLogin() {
        navigationController?.pushViewController(HomeViewController(), animated: true)
    }
    
    func profileTableViewCellDidTapFavorite() {
        navigationController?.pushViewController(ClubsViewController(), animated: true)
    }
    
    func profileTableViewCellDidTapMyNews() {
        navigationController?.pushViewController(ClubsViewController(), animated: true)
    }
    
    func profileTableViewCellDidTapHelp() {
        navigationController?.pushViewController(ClubsViewController(), animated: true)
    }
    
    func profileTableViewCellDidTapSettings() {
        navigationController?.pushViewController(SettingsViewController(), animated: true)
    }
    
    
    
    
    }






