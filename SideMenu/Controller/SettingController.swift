//
//  SettingController.swift
//  SideMenu
//
//  Created by hexlant_01 on 2020/01/09.
//  Copyright © 2020 hexlant_01. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {
    
    // MARK: - Properties
    var username: String?
    var imgView: UIImageView!
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        if let username = username {
            print("Username is \(username)")
        }
    }
    
    // MARK: - Selectors
    @objc func handleDismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Helper Functions
    
    func configureUI() {
        view.backgroundColor = .cyan
        
        navigationController?.navigationBar.barTintColor = .orange
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.title = "Settings"
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "baseline_clear_white_36pt_3x").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismiss))
    }
}
