//
//  ViewController.swift
//  RandomCharacterApp
//
//  Created by  Mukhammed Ali Khamzayev on 31.08.2023.
//

import UIKit
import SnapKit

class TestViewController: UIViewController {

    
//    enum CellType {
//        case customCell1
//        case customCell2
//    }
    
    private var tableView: UITableView {
        let tableView = UITableView()
       
        
//        tableView.register(CustomCell2.self, forCellReuseIdentifier: )
//        tableView.register(CustomCell3.self, forCellReuseIdentifier: )
//        tableView.register(CustomCell4.self, forCellReuseIdentifier: )
//        tableView.register(CustomCell5.self, forCellReuseIdentifier: )
        return tableView
    }
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.register(CustomCellOne.self, forCellReuseIdentifier: "CustomCell1")
        tableView.register(CustomCellTwo.self, forCellReuseIdentifier: "CustomCell2")
        setupConstraints()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        tableView.frame = view.bounds
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints {
            print(view.bounds)
            $0.width.equalTo(342)
//            $0.top.equalToSuperview()
//            $0.left.equalToSuperview()
//            $0.right.equalToSuperview()
//            $0.bottom.equalToSuperview()
            $0.height.equalTo(100)
        }
    }
    
}
extension TestViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        114
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellOne", for: indexPath) as? CustomCellOne
                    // Configure CustomCell1 here
            return cell ?? UITableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellTwo", for: indexPath) as? CustomCellTwo 
                    // Configure CustomCell2 here
            return cell ?? UITableViewCell()
        }
        
        return UITableViewCell()
    }
    
    

}


