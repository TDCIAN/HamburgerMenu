//
//  MenuOption.swift
//  SideMenu
//
//  Created by hexlant_01 on 2020/01/09.
//  Copyright © 2020 hexlant_01. All rights reserved.
//

import UIKit
// 사이드메뉴에 들어갈 셀의 제목들을 결정하는 모델
enum MenuOption: Int, CustomStringConvertible {
    
    case Profile // 0번
    case Inbox // 1번
    case Notifications // 2번
    case Settings // 3번
    
    var description: String {
        switch self {
        case .Profile: return "Profile"
        case .Inbox: return "Inbox"
        case .Notifications: return "Notifications"
        case .Settings: return "Settings"
        }
    }
    
    var image: UIImage {
        switch self {
        case .Profile: return UIImage(named: "ic_person_outline_white_2x") ?? UIImage()
        case .Inbox: return UIImage(named: "ic_mail_outline_white_2x") ?? UIImage()
        case .Notifications: return UIImage(named: "ic_menu_white_3x") ?? UIImage()
        case .Settings: return UIImage(named: "baseline_settings_white_24dp") ?? UIImage()
        }
    }
}
