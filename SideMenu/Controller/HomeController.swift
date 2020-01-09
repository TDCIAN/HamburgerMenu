//
//  HomeController.swift
//  SideMenu
//
//  Created by hexlant_01 on 2020/01/09.
//  Copyright © 2020 hexlant_01. All rights reserved.
//
import UIKit

class HomeController: UIViewController {
    
    // MARK: - Properties
    
    var delegate: HomeControllerDelegate? // Utils폴더 Protocol.swift 파일에서 만든 프로토콜
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        configureNavigationBar()
    }
    
    // MARK: - Handlers
    
    @objc func handleMenuToggle() {
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .lightGray
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "Side Menu"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu_white_3x").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
}
