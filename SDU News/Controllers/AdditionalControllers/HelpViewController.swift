//
//  HelpViewController.swift
//  SDU News
//
//  Created by  Mukhammed Ali Khamzayev on 24.03.2023.
//

import Foundation
import UIKit
import SnapKit


class HelpViewController: UIViewController {
    
    private let helpLabel: UILabel = {
       let label = UILabel()
        label.text = "Help"
        label.font =  UIFont(name: "Nunito-Bold", size: 40)
        label.textColor = UIColor(red: 9/255, green: 24/255, blue: 96/255, alpha: 1)
        return label
    }()
    
    private let helpLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "help2")
        return imageView
    }()
    
    private let infoLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.text = "SDU news - here all the news of the university will be in your hands. In SDU news is not only news, here you can subscribe to different Clubs and events. We are glad to see you in our application. Don't miss the news"
        label.font =  UIFont(name: "Nunito-Regular", size: 20)
        label.textColor = UIColor(red: 9/255, green: 24/255, blue: 96/255, alpha: 1)
        label.numberOfLines = 0
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
        view.addSubview(helpLabel)
        view.addSubview(anyQuestionsLabel)
        view.addSubview(firstNumberLabel)
        view.addSubview(secondNumberLabel)
        view.addSubview(mailLabel)
        view.addSubview(infoLabel)
        view.addSubview(helpLogo)
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
        helpLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(160)
           
        }
        
        helpLogo.snp.makeConstraints {
            $0.left.equalTo(helpLabel.snp.right)
            $0.top.equalToSuperview().inset(165)
        }
        
        infoLabel.snp.makeConstraints {
            $0.top.equalTo(helpLabel.snp.bottom).inset(-101)
            $0.left.equalToSuperview().inset(17)
            $0.right.equalToSuperview().inset(17)
        }
        
        anyQuestionsLabel.snp.makeConstraints {
            $0.top.equalTo(infoLabel.snp.bottom).inset(-47)
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
