//
//  SettingsViewController.swift
//  SDU News
//
//  Created by  Mukhammed Ali Khamzayev on 24.03.2023.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    
    private let settingsLabel: UILabel = {
       let label = UILabel()
        label.text = "Settings"
        label.font =  UIFont(name: "Nunito-Bold", size: 40)
        label.textColor = UIColor(red: 9/255, green: 24/255, blue: 96/255, alpha: 1)
        return label
    }()
    
    private let languageLabel: UILabel = {
        let label = UILabel()
        label.text = "Language:"
        label.textColor = .secondaryLabel
        label.font = UIFont(name: "MontserratRoman-Regular", size: 16)
        return label
    }()
    
    private let buttonKazakh: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Қазақ", for: .normal)
        button.backgroundColor = UIColor(red: 177/255, green: 177/255, blue: 177/255, alpha: 1)
        button.layer.cornerRadius = 10
        button.tintColor = .black
        return button
    }()
    
    private let buttonRussian: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Русский", for: .normal)
        button.backgroundColor = UIColor(red: 177/255, green: 177/255, blue: 177/255, alpha: 1)
        button.layer.cornerRadius = 10
        button.tintColor = .black
        return button
    }()
    
    private let buttonEnglish: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("English", for: .normal)
        button.backgroundColor = UIColor(red: 177/255, green: 177/255, blue: 177/255, alpha: 1)
        button.layer.cornerRadius = 10
        button.tintColor = .black
        return button
    }()
    
    private let buttonLight: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "light"), for: .normal)
        return button
    }()
    
    private let buttonDark: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "dark"), for: .normal)
        return button
    }()
    
    private let buttonAuto: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "auto"), for: .normal)
        return button
    }()
    
    
    private let appereanceLabel: UILabel = {
       let label = UILabel()
        label.text = "Appereance:"
        label.textColor = .secondaryLabel
        label.font = UIFont(name: "MontserratRoman-Regular", size: 16)
        return label
    }()
    
    
    private let anyQuestionsLabel: UILabel = {
       let label = UILabel()
        label.text = "Any Questions?"
        label.font = UIFont(name: "MontserratRoman-Regular", size: 16)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let firstNumberLabel: UILabel = {
       let label = UILabel()
        label.text = "8778-123-23-23"
        label.font = UIFont(name: "MontserratRoman-Regular", size: 16)
        label.textColor = UIColor(red: 9/255, green: 24/255, blue: 96/255, alpha: 1)
        return label
    }()
    
    private let secondNumberLabel: UILabel = {
       let label = UILabel()
        label.text = "8701-123-23-23"
        label.font = UIFont(name: "MontserratRoman-Regular", size: 16)
        label.textColor = UIColor(red: 9/255, green: 24/255, blue: 96/255, alpha: 1)
        return label
    }()
    
    private let mailLabel: UILabel = {
       let label = UILabel()
        label.text = "infosdu@stu.sdu.edu.kz"
        label.font = UIFont(name: "MontserratRoman-Regular", size: 16)
        label.textColor = UIColor(red: 9/255, green: 24/255, blue: 96/255, alpha: 1)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(anyQuestionsLabel)
        view.addSubview(settingsLabel)
        view.addSubview(languageLabel)
        view.addSubview(buttonKazakh)
        view.addSubview(buttonRussian)
        view.addSubview(buttonEnglish)
        view.addSubview(appereanceLabel)
        view.addSubview(buttonDark)
        view.addSubview(buttonLight)
        view.addSubview(buttonAuto)
        view.addSubview(firstNumberLabel)
        view.addSubview(secondNumberLabel)
        view.addSubview(mailLabel)
        navbarConfiguration()
        configureConstraitns()
        
        
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
    
    private func configureConstraitns() {
        settingsLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(160)
            $0.left.equalToSuperview().inset(110)
        }
        
        languageLabel.snp.makeConstraints {
            $0.top.equalTo(settingsLabel.snp.bottom).inset(-45)
            $0.left.equalToSuperview().inset(28)
        }
        
        buttonKazakh.snp.makeConstraints {
            $0.width.equalTo(121)
            $0.height.equalTo(50)
            $0.left.equalToSuperview().inset(13)
            $0.top.equalTo(languageLabel.snp.bottom).inset(-12)
            
        }
        
     
        
        
        
        buttonRussian.snp.makeConstraints {
            $0.width.equalTo(121)
            $0.height.equalTo(50)
            $0.left.equalTo(buttonKazakh.snp.right)
            $0.top.equalTo(languageLabel.snp.bottom).inset(-12)
        }
        
        buttonEnglish.snp.makeConstraints {
            $0.width.equalTo(121)
            $0.height.equalTo(50)
            $0.left.equalTo(buttonRussian.snp.right)
            $0.top.equalTo(languageLabel.snp.bottom).inset(-12)
            $0.right.equalToSuperview().inset(13)
        }
        
        appereanceLabel.snp.makeConstraints {
            $0.top.equalTo(buttonKazakh.snp.bottom).inset(-80)
            $0.left.equalToSuperview().inset(28)
        }
        
        buttonLight.snp.makeConstraints {
            $0.width.equalTo(108)
            $0.height.equalTo(115)
            $0.left.equalToSuperview().inset(13)
            $0.top.equalTo(appereanceLabel.snp.bottom).inset(-12)
        }
        
        buttonDark.snp.makeConstraints(){
            $0.width.equalTo(108)
            $0.height.equalTo(115)
            $0.left.equalTo(buttonLight.snp.right).inset(-13)
            $0.top.equalTo(appereanceLabel.snp.bottom).inset(-12)
        }
        
        buttonAuto.snp.makeConstraints(){
            $0.width.equalTo(108)
            $0.height.equalTo(115)
            $0.left.equalTo(buttonDark.snp.right).inset(-13)
            $0.top.equalTo(appereanceLabel.snp.bottom).inset(-12)
        }
        
        anyQuestionsLabel.snp.makeConstraints {
            $0.top.equalTo(buttonAuto.snp.bottom).inset(-67)
            $0.centerX.equalToSuperview()
        }
        
        firstNumberLabel.snp.makeConstraints {
            $0.top.equalTo(anyQuestionsLabel.snp.bottom).inset(-17)
            $0.centerX.equalToSuperview()
        }
        
        secondNumberLabel.snp.makeConstraints {
            $0.top.equalTo(firstNumberLabel.snp.bottom).inset(-10)
            $0.centerX.equalToSuperview()
        }
        
        mailLabel.snp.makeConstraints {
            $0.top.equalTo(secondNumberLabel.snp.bottom).inset(-10)
            $0.centerX.equalToSuperview()
        }
        
        
        
    }
    

}
