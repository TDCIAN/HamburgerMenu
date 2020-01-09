//
//  MenuController.swift
//  SideMenu
//
//  Created by hexlant_01 on 2020/01/09.
//  Copyright © 2020 hexlant_01. All rights reserved.
//
import UIKit

private let reuseIdentifier = "MenuOptionCell"

class MenuController: UIViewController {
    
    // MARK: - Properties
    var tableView: UITableView!
    var delegate: HomeControllerDelegate? // Utils 폴더의 Protocol.swift 파일에서 만든 프로토콜
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    // MARK: - Handlers
    func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MenuOptionCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.backgroundColor = .systemBlue // 사이드메뉴 바의 배경 색상
        tableView.separatorStyle = .none // 테이블 뷰 구분 선 없애기
        tableView.rowHeight = 80 // 테이블 뷰 한 행당 높이
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    
    }
}


extension MenuController: UITableViewDelegate, UITableViewDataSource {
    // 테이블 뷰를 몇 줄을 보이게 할 것인가
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4 // 테이블뷰(사이드메뉴바에)에 네 줄이 보이게 하겠다
    }
    
    // 테이블 뷰 메뉴들을 어떻게 표현할 것인가
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier , for: indexPath) as! MenuOptionCell
        
        // Model 폴더의 MenuOption에서 만든 내용을 끌어다 쓴다
        let menuOption = MenuOption(rawValue: indexPath.row)
        cell.descriptionLabel.text = menuOption?.description
        cell.iconImageView.image = menuOption?.image
        
        return cell
    }
    
    // 테이블 뷰 메뉴들 중 클릭된 애는 어떻게 다룰 것인가
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuOption = MenuOption(rawValue: indexPath.row)
        delegate?.handleMenuToggle(forMenuOption: menuOption)
    }
}
