//
//  SignInViewController.swift
//  SDU News
//
//  Created by  Mukhammed Ali Khamzayev on 16.03.2023.
//

import UIKit
import SnapKit

class SignInViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(signInLabel)
        view.addSubview(requestLabel)
        view.addSubview(userSquareLogo)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(forgotPasswordButton)
        view.addSubview(loginButton)
        view.addSubview(promptLabel)
        view.addSubview(promptSignUpButton)
        navbarConfiguration()
        configureConstraitns()
        signUpPageMove()
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
        
       
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hidesBottomBarWhenPushed = true
    }
    
    
    private func signUpPageMove() {
        promptSignUpButton.addTarget(self, action: #selector(moveToSignUp), for: .touchUpInside)
    }
    
    @objc private func moveToSignUp() {
        let vc = SignUpViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private let promptLabel: UILabel = {
        let label = UILabel()
        label.text = "Don't have an account?"
        label.textColor = .secondaryLabel
        label.font = UIFont(name: "MontserratRoman-Regular", size: 16)
        return label
    }()
    
    private let promptSignUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign up", for: .normal)
        button.tintColor = .black
        button.titleLabel?.font = UIFont(name: "MontserratRoman-Regular", size: 16)
       return button
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 9/255, green: 24/255, blue: 96/255, alpha: 1)
        button.titleLabel?.font = UIFont(name: "MontserratRoman-Regular", size: 15)
        button.layer.cornerRadius = 20
        button.setTitle("LOGIN", for: .normal)
        button.tintColor = .white
        
        return button
    }()
    
    
    private let forgotPasswordButton: UIButton = {
        let button = UIButton(type:.system)
        button.setTitle("Forgot password?", for: .normal)
        button.titleLabel?.font = UIFont(name: "MontserratRoman-Regular", size: 14)
        button.tintColor = UIColor(red: 9/255, green: 24/255, blue: 96/255, alpha: 1)
        return button
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .emailAddress
        textField.attributedPlaceholder = NSAttributedString(string: "Email",                                                   attributes: [NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel,
                                                                                                                                             NSAttributedString.Key.font: UIFont(name: "MontserratRoman-Regular", size: 16)])
        
        return textField
    }()
    
    
    private let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.keyboardType = .emailAddress
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password",                                                   attributes: [NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel,
                                                                                                                                                        NSAttributedString.Key.font: UIFont(name: "MontserratRoman-Regular", size: 16)])
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
    }()

    private let signInLabel: UILabel = {
       let label = UILabel()
        label.text = "Sign In"
        label.textAlignment = .left
        label.textColor = .black
        label.font =  UIFont(name: "Nunito-Bold", size: 40)
       
        return label
    }()
    
    private let userSquareLogo: UIImageView = {
        let size: CGFloat = 25
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: size, height: size))
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "user-square")
        return imageView
    }()
    
    private let requestLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your email and password"
        label.textColor = .secondaryLabel
        label.font = UIFont(name: "MontserratRoman-Regular", size: 16)
        return label
    }()
    
    
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
    
   
    
    func configureConstraitns() {
        signInLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(188)
            $0.left.equalToSuperview().inset(110)
        }
        
        requestLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(signInLabel.snp.bottom).inset(-98)
        }
        
        userSquareLogo.snp.makeConstraints {
            $0.left.equalTo(signInLabel.snp.right).inset(20)
            $0.top.equalTo(signInLabel.snp.top)
            $0.bottom.equalTo(signInLabel.snp.bottom)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(requestLabel.snp.bottom).inset(-47)
            $0.right.equalToSuperview().inset(20)
            $0.left.equalToSuperview().inset(28)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).inset(-20)
            $0.right.equalToSuperview().inset(20)
            $0.left.equalToSuperview().inset(28)
        }
        
        forgotPasswordButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).inset(-20)
            $0.right.equalToSuperview().inset(20)
            
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).inset(-101)
            $0.left.equalTo(20)
            $0.right.equalTo(-20)
            $0.width.equalTo(350)
            $0.height.equalTo(44)
        }
        
        promptLabel.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).inset(-50)
            $0.left.equalToSuperview().inset(61)
        }
        
        promptSignUpButton.snp.makeConstraints {
            $0.left.equalTo(promptLabel.snp.right)
            $0.right.equalToSuperview().inset(75)
            $0.top.equalTo(loginButton.snp.bottom).inset(-43)
        }
    }
    
   
   

}


