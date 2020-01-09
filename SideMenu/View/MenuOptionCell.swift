//
//  MenuOptionCell.swift
//  SideMenu
//
//  Created by hexlant_01 on 2020/01/09.
//  Copyright © 2020 hexlant_01. All rights reserved.
//

import UIKit

// 사이드 메뉴 바에 들어갈 메뉴들의 모양을 결정하는 셀
class MenuOptionCell: UITableViewCell {
    
    // MARK: - Properties
    let iconImageView: UIImageView = { // 테이블뷰 행에 들어갈 이미지가 들어갈 이미지 뷰
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.backgroundColor = .green // 이미지 들어갈 곳의 배경 색
        return iv
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Sample text" // 테이블뷰에 들어갈 텍스트
        return label
    }()
    
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .systemYellow // 컨텐츠가 들어갈 테이블뷰 행의 배경 색상
        selectionStyle = .none // 테이블뷰의 행을 클릭했을 때 클릭한 티를 낼 것이냐 말 것이냐
        
        addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 12).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Handlers
}
