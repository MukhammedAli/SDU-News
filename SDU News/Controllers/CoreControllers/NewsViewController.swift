//
//  NewsViewController.swift
//  SDU News
//
//  Created by  Mukhammed Ali Khamzayev on 16.03.2023.
//

import Foundation
import UIKit


class NewsViewController: UIViewController {
    
    
    private enum SectionTabs: String {
        case all = "All"
        case events = "Events"
        case engineering = "Engineering"
        case bussiness = "Bussiness"
        case humanities = "Humanities"
        
        var index: Int {
            switch self {
            case .all:
                return 0
            case .events:
                return 1
            case .engineering:
                return 2
            case .bussiness:
                return 3
            case .humanities:
                return 4
            }
        }
    }
    
    
    private var leadingAnchors: [NSLayoutConstraint] = []
    private var trailingAnchors: [NSLayoutConstraint] = []
    
    //["All","Events", "Engineering", "Bussiness", "Humanities", ]
    private var tabs: [UIButton] = ["All","Events", "Engineering", "Bussiness", "Humanities" ].map { buttonTitle in
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont(name: "Nunito-Regular", size: 16)
        button.tintColor = .label
        button.setTitle(buttonTitle, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    private let indicator: UIView = {
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
    
    private lazy var sectionStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: tabs)
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var navbarTitle: UILabel = {
        let label = UILabel()
        label.text = "News"
        label.textColor = UIColor(red: 9/255, green: 24/255, blue: 96/255, alpha: 1)
        label.font = UIFont(name: "Poppins-Bold", size: 20)
        return label
    }()
    
    private let newsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FavoriteTableViewCell.self, forCellReuseIdentifier: "cellAll")
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = navbarTitle
        view.addSubview(sectionStack)
        view.addSubview(indicator)
        view.addSubview(newsTableView)
        newsTableView.delegate = self
        newsTableView.dataSource = self
        configureStackButtons()
        applyConstraints()
    }
    
    private func configureStackButtons() {
        for (i, button) in sectionStack.arrangedSubviews.enumerated() {
            guard let button = button as? UIButton else {return}
            if i == selectedTab {
                button.tintColor = .label
            } else  {
                button.tintColor = .secondaryLabel
            }
            
            button.addTarget(self, action: #selector(didTapTab(_ :)), for: .touchUpInside)
        }
    }
    
    @objc private func didTapTab(_ sender: UIButton) {
        print(sender.titleLabel?.text ?? "")
        guard let label = sender.titleLabel?.text else {return}
        switch label {
        case SectionTabs.all.rawValue:
            selectedTab = 0
        case SectionTabs.events.rawValue:
            selectedTab = 1
        case SectionTabs.engineering.rawValue:
            selectedTab = 2
        case SectionTabs.bussiness.rawValue:
            selectedTab = 3
        case SectionTabs.humanities.rawValue:
            selectedTab = 4
        default:
            selectedTab = 0
        }
        
        
    }
    
    private func applyConstraints() {
        for i in 0..<tabs.count {
            let leadingAnchor = indicator.leadingAnchor.constraint(equalTo: sectionStack.arrangedSubviews[i].leadingAnchor)
            leadingAnchors.append(leadingAnchor)
            let trailingAnchor = indicator.trailingAnchor.constraint(equalTo: sectionStack.arrangedSubviews[i].trailingAnchor)
            trailingAnchors.append(trailingAnchor)
            
            sectionStack.snp.makeConstraints {
                $0.left.equalToSuperview().inset(20)
                $0.top.equalTo(view.safeAreaLayoutGuide).inset(10)
                $0.right.equalToSuperview()
                
                
            }
        }
        
        newsTableView.snp.makeConstraints {
            $0.width.equalTo(342)
            $0.top.equalTo(sectionStack.snp.bottom).inset(-30)
            $0.left.equalToSuperview().inset(25)
            $0.right.equalToSuperview().inset(23)
            $0.height.equalTo(view.frame.height)
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

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellAll") as? FavoriteTableViewCell
        else {return UITableViewCell()}
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        114
    }
}
