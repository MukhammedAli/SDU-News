//
//  SignUpViewController.swift
//  SDU News
//
//  Created by  Mukhammed Ali Khamzayev on 16.03.2023.
//

import UIKit

class SignUpViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(loginLabel)
        view.addSubview(requestLabel)
        view.addSubview(userSquareLogo)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(forgotPasswordButton)
        view.addSubview(signUpButton)
        view.addSubview(promptLabel)
        view.addSubview(promptSignInButton)
        view.addSubview(fullNameTextField)
        view.addSubview(confirmYourPasswordTextField)
        navbarConfiguration()
        configureConstraitns()
        signInPageMove()
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
        
       
        
        // Do any additional setup after loading the view.
    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        hidesBottomBarWhenPushed = true
//    }
    
    
    private func signInPageMove() {
        promptSignInButton.addTarget(self, action: #selector(moveToSignUp), for: .touchUpInside)
    }
    
    @objc private func moveToSignUp() {
        let vc = SignUpViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private let fullNameTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .default
        textField.attributedPlaceholder = NSAttributedString(string: "Full name",                                                   attributes: [NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel,
                                                                                                                                             NSAttributedString.Key.font: UIFont(name: "MontserratRoman-Regular", size: 16)])
        return textField
    }()
    
    
    private let confirmYourPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .default
        textField.attributedPlaceholder = NSAttributedString(string: "Confirm your password",                                                   attributes: [NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel,
                                                                                                                                             NSAttributedString.Key.font: UIFont(name: "MontserratRoman-Regular", size: 16)])
        textField.isSecureTextEntry = true
        return textField
    }()
    
    
    private let promptLabel: UILabel = {
        let label = UILabel()
        label.text = "Already have an account?"
        label.textColor = .secondaryLabel
        label.font = UIFont(name: "MontserratRoman-Regular", size: 16)
        return label
    }()
    
    private let promptSignInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign up", for: .normal)
        button.tintColor = .black
        button.titleLabel?.font = UIFont(name: "MontserratRoman-Regular", size: 16)
       return button
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 9/255, green: 24/255, blue: 96/255, alpha: 1)
        button.titleLabel?.font = UIFont(name: "MontserratRoman-Regular", size: 15)
        button.layer.cornerRadius = 20
        button.setTitle("SIGN UP", for: .normal)
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
        passwordTextField.keyboardType = .default
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password",                                                   attributes: [NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel,
                                                                                                                                                        NSAttributedString.Key.font: UIFont(name: "MontserratRoman-Regular", size: 16)])
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
    }()

    private let loginLabel: UILabel = {
       let label = UILabel()
        label.text = "Sign Up"
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
        label.text = "First create your account"
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
        loginLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(188)
            $0.left.equalToSuperview().inset(100)
        }
        
        requestLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(loginLabel.snp.bottom).inset(-98)
        }
        
        userSquareLogo.snp.makeConstraints {
            $0.left.equalTo(loginLabel.snp.right).inset(20)
            $0.top.equalTo(loginLabel.snp.top)
            $0.bottom.equalTo(loginLabel.snp.bottom)
        }
        
        fullNameTextField.snp.makeConstraints {
            $0.top.equalTo(requestLabel.snp.bottom).inset(-47)
            $0.right.equalToSuperview().inset(20)
            $0.left.equalToSuperview().inset(28)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(fullNameTextField.snp.bottom).inset(-20)
            $0.right.equalToSuperview().inset(20)
            $0.left.equalToSuperview().inset(28)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).inset(-20)
            $0.right.equalToSuperview().inset(20)
            $0.left.equalToSuperview().inset(28)
        }
        
        confirmYourPasswordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).inset(-20)
            $0.right.equalToSuperview().inset(20)
            $0.left.equalToSuperview().inset(28)
        }
        
        
        
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).inset(-101)
            $0.left.equalTo(20)
            $0.right.equalTo(-20)
            $0.width.equalTo(350)
            $0.height.equalTo(44)
        }
        
        promptLabel.snp.makeConstraints {
            $0.top.equalTo(signUpButton.snp.bottom).inset(-50)
            $0.left.equalToSuperview().inset(48)
        }
        
        promptSignInButton.snp.makeConstraints {
            $0.left.equalTo(promptLabel.snp.right)
            $0.right.equalToSuperview().inset(72)
            $0.top.equalTo(signUpButton.snp.bottom).inset(-43)
        }
        
        
    }
    
   
   

}



