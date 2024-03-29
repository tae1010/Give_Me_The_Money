//
//  sideAddButton.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/03/22.
//

import Foundation
import UIKit
import SnapKit
import RxCocoa
import RxSwift

class SideAddButton: UIView {
    
    // 체크 image
    let checkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "nonCheck")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // 버튼 종류 image
    let descriptionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // 버튼 타이틀 label
    let menuTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "메인"
        label.textAlignment = .center
        label.font = UIFont.nanumSquareNeoExtrabold(size: 16)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 버튼 설명 Label
    let menuDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "설명"
        label.textAlignment = .center
        label.font = UIFont.nanumSquareNeoBold(size: 13)
        label.textColor = .lightGray
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 버튼 종류를 정의 하기 위한 객체
    var buttonMode: SideButtonMode?
    let disposeBag = DisposeBag()
    
    init(buttonMode: SideButtonMode) {
        super.init(frame: .zero)

        let tapGesture = UITapGestureRecognizer()
        self.addGestureRecognizer(tapGesture)
        
        tapGesture.rx.event.bind(onNext: { _ in
            print(buttonMode,"ssssss")
        }).disposed(by: disposeBag)
        
        self.buttonMode = buttonMode
        self.setButtonMode(buttonMode)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    
    // 버튼 종류 정의 (게임 만들기, 모임 만들기)
    func setButtonMode(_ sideButtonMode: SideButtonMode) {
        
        if sideButtonMode == .group {
            descriptionImageView.image = UIImage(named: "noSelectGroupButton")
            menuTitleLabel.text = "모임 만들기"
            menuDescriptionLabel.text = "총무가 되어 돈을 관리, 계산해요"
        }
        
        else if sideButtonMode == .game {
            descriptionImageView.image = UIImage(named: "noSelectGameButton")
            menuTitleLabel.text = "게임 만들기"
            menuDescriptionLabel.text = "내기를 해서 진 사람이 더 많이 내요"
        }
        
        
    }
}


// MARK: configureView
extension SideAddButton {
    
    func setUI() {
        addSubview(checkImageView)
        addSubview(descriptionImageView)
        addSubview(menuTitleLabel)
        addSubview(menuDescriptionLabel)
        
        setLayOut()
        configureUI()
    }
    
    // add Button 모양 지정
    func setLayOut() {
        
        self.widthAnchor.constraint(equalToConstant: AppConstants.screenWidth * 0.9).isActive = true
        self.heightAnchor.constraint(equalToConstant: AppConstants.screenHeight * 0.4 / 3).isActive = true
        
        checkImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        checkImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: AppConstants.setupNormalConstantSize(size: 20)).isActive = true
        
        menuTitleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: AppConstants.setupNormalConstantSize(size: -9)).isActive = true
        menuTitleLabel.leadingAnchor.constraint(equalTo: self.checkImageView.trailingAnchor, constant: AppConstants.setupNormalConstantSize(size: 20)).isActive = true
        
        menuDescriptionLabel.topAnchor.constraint(equalTo: self.centerYAnchor, constant: AppConstants.setupNormalConstantSize(size: 10)).isActive = true
        menuDescriptionLabel.leadingAnchor.constraint(equalTo: menuTitleLabel.leadingAnchor).isActive = true
        
        descriptionImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        descriptionImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: AppConstants.setupNormalConstantSize(size: -30)).isActive = true
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
