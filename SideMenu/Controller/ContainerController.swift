//
//  ContainerController.swift
//  SideMenu
//
//  Created by hexlant_01 on 2020/01/09.
//  Copyright © 2020 hexlant_01. All rights reserved.
//
import UIKit

class ContainerController: UIViewController {
    
    // MARK: - Properties
    
    var menuController: MenuController!
    var centerController: UIViewController!
    var isExpanded = false // 앱을 처음 켰을 때는 사이드메뉴가 닫혀 있어야 하니까
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
    }
    
    // 상태바의 컨셉을 어떻게 할 것이냐
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent // 하얗게 표시하겠다
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    override var prefersStatusBarHidden: Bool {
        return isExpanded
    }
    
    // MARK: - Handlers
    
    func configureHomeController() {
        let homeController = HomeController()
        homeController.delegate = self
        centerController = UINavigationController(rootViewController: homeController)
        
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    func configureMenuController() {
        if menuController == nil {
            // add our menu controller here
            menuController = MenuController()
            menuController.delegate = self
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
        }
    }
    
    func animatePanel(shouldExpand: Bool, menuOption: MenuOption?) {
        
        if shouldExpand {
            // 메뉴바를 펼친다
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                // 사이드메뉴가 얼마나 튀어나오게 할 것이냐를 결정
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
            }, completion: nil)
        } else {
            // 메뉴바를 감춘다
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                // 사이드메뉴가 얼마나 튀어나오게 할 것이냐를 결정
                self.centerController.view.frame.origin.x = 0
            }) { (_) in
                guard let menuOption = menuOption else { return }
                self.didSelectMenuOption(menuOption: menuOption)
            }
        }
        animateStatusBar()
    }
    
    func didSelectMenuOption(menuOption: MenuOption) {
        switch menuOption {
        case .Profile:
            print("Show profile")
        case .Inbox:
            print("Show Inbox")
        case .Notifications:
            print("Show Notifications")
        case .Settings:
            let controller = SettingsController()
            controller.username = "Batman"
            present(UINavigationController(rootViewController: controller), animated: true, completion: nil) // 다른 뷰 컨트롤러로 이동하고 싶다면 present를 사용해야 한다
        }
    }
    
    func animateStatusBar() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)
    }
}


extension ContainerController: HomeControllerDelegate { // Utils 폴더 안의 Protocol.swift파일에 만든 프로토콜
    
    func handleMenuToggle(forMenuOption menuOption: MenuOption?) {
        
        if !isExpanded {
            configureMenuController()
        }
        
        isExpanded = !isExpanded
        animatePanel(shouldExpand: isExpanded, menuOption: menuOption)
    }
    
}
