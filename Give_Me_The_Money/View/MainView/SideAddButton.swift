//
//  sideAddButton.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/03/22.
//

import Foundation
import UIKit
import SnapKit

enum ButtonMode {
    case game
    case group
}

class SideAddButton: UIView {
    
    // 체크 이미지
    let checkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "check")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // 버튼 종류 이미지
    let descriptionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // 버튼 라벨
    let menuLabel: UILabel = {
        let label = UILabel()
        label.text = "만들기"
        label.textAlignment = .center
        label.font = UIFont(name: "NanumGothicOTFExtraBold", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    var buttonMode: ButtonMode?
    
    init(buttonMode: ButtonMode) {
        super.init(frame: .zero)
        print("이거 불림?")
        self.setButtonMode(buttonMode)
        
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = UIColor.blue
    }
    
    
    func setButtonMode(_ buttonMode: ButtonMode) {
        if buttonMode == .game {
            descriptionImageView.image = UIImage(named: "gameButton")
            menuLabel.text = "게임 만들기"
        } else {
            descriptionImageView.image = UIImage(named: "groupButton")
            menuLabel.text = "모임 만들기"
        }
        
    }
    
    
    
    
}


// MARK: configureView
extension SideAddButton {
    
    func setUI() {
        addSubview(checkImageView)
        addSubview(descriptionImageView)
        addSubview(menuLabel)
        
        setLayOut()
        configureUI()
    }
    
    // add Button 모양 지정
    func setLayOut() {
        
        self.widthAnchor.constraint(equalToConstant: AppConstants.ScreenWidth * 0.9).isActive = true
        self.heightAnchor.constraint(equalToConstant: AppConstants.ScreenHeight * 0.4 / 4).isActive = true
        
        checkImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        checkImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        
        menuLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        menuLabel.leadingAnchor.constraint(equalTo: self.checkImageView.trailingAnchor, constant: 20).isActive = true
        
        descriptionImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        descriptionImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
    }
    
    func configureUI() {
        
        self.layer.cornerRadius = 15
        
        self.backgroundColor = UIColor.white
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.3
    }
    
}
