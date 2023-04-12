//
//  ClubDetailsViewController.swift
//  SDU News
//
//  Created by  Mukhammed Ali Khamzayev on 07.04.2023.
//

import UIKit

class ClubDetailsViewController: UIViewController {

    private var leadingAnchors: [NSLayoutConstraint] = []
    private var trailingAnchors: [NSLayoutConstraint] = []
    
    private enum SectionTabs: String {
        case news = "News"
        case events = "Events"
     
        
        
        
        var index: Int {
            switch self {
            case .news:
                return 0
            case .events:
                return 1
            }
        }
    }
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
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: UIScreen.main.bounds)
        return scrollView
    }()
    
    
    private var tabs: [UIButton] = ["News","Events"].map { buttonTitle in
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont(name: "Nunito-Regular", size: 16)
        button.tintColor = .label
        button.setTitle(buttonTitle, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    private let newsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ClubNewsTableViewCell.self, forCellReuseIdentifier: "cellClubNews")
        return tableView
    }()
    
    private lazy var sectionStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: tabs)
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
       return stackView
    }()
    
    private let descriptiveView = UIView()
    private let newsView = UIView()
    
    private let descriptionText: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text =  "is an operational business division of the British Broadcasting Corporation responsible for the gathering and broadcasting of news and current affairs."
        label.textColor = .secondaryLabel
        label.font = UIFont(name: "Poppins-Bold", size: 15)
        return label
    }()
    
    private let clubsLogo: UIImageView = {
       let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 45
        return imageView
    }()
    
    private var clubName: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont(name: "Poppins-Bold", size: 20)
        return label
    }()
    
    func setImage(imageNames: String) {
       clubsLogo.image = UIImage(named: imageNames)
   }
    func setClubName(labelText: String) {
       clubName.text = labelText
   }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        newsView.addSubview(sectionStack)
        newsView.addSubview(indicator)
        newsView.addSubview(newsTableView)
        descriptiveView.addSubview(clubName)
        descriptiveView.addSubview(descriptionText)
        scrollView.addSubview(clubsLogo)
        scrollView.addSubview(descriptiveView)
        scrollView.addSubview(newsView)
        newsTableView.delegate = self
        newsTableView.dataSource = self
        scrollView.isScrollEnabled = true
        configureConstraints()
        configureStackButtons()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height + 10)
        scrollView.frame = view.bounds
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
        case SectionTabs.news.rawValue:
            selectedTab = 0
        case SectionTabs.events.rawValue:
            selectedTab = 1
        default:
            selectedTab = 0
        }
    }
    
    private func configureConstraints() {
        for i in 0..<tabs.count {
            let leadingAnchor = indicator.leadingAnchor.constraint(equalTo: sectionStack.arrangedSubviews[i].leadingAnchor)
            leadingAnchors.append(leadingAnchor)
            let trailingAnchor = indicator.trailingAnchor.constraint(equalTo: sectionStack.arrangedSubviews[i].trailingAnchor)
            trailingAnchors.append(trailingAnchor)
        }
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview()
        }
        
        clubsLogo.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.left.equalToSuperview().inset(148)
            $0.right.equalToSuperview().inset(152)
            $0.width.equalTo(90)
            $0.height.equalTo(90)
        }
        
        descriptiveView.snp.makeConstraints {
            $0.top.equalTo(clubsLogo.snp.bottom).inset(-16)
            $0.left.right.equalToSuperview().inset(24)
            $0.width.equalTo(125)
        }
        
        clubName.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        descriptionText.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(clubName.snp.bottom).inset(-5)
            $0.bottom.equalToSuperview()
        }
        
        newsView.snp.makeConstraints {
            $0.top.equalTo(descriptiveView.snp.bottom).inset(-15)
            $0.left.right.equalToSuperview().inset(24)
            $0.height.equalTo(600)
        }
        
        sectionStack.snp.makeConstraints {
            $0.left.equalToSuperview().inset(90)
            $0.right.equalToSuperview().inset(90)
            $0.top.equalToSuperview()
        }
        
        newsTableView.snp.makeConstraints {
            $0.width.equalTo(342)
            $0.top.equalTo(sectionStack.snp.bottom).inset(-11)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.height.equalTo(500)
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


extension ClubDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellClubNews") as? ClubNewsTableViewCell
        else {return UITableViewCell()}
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        114
    }
    

}


