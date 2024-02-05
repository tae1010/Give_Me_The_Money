//
//  SettingPopupViewController.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2024/02/05.
//

import Foundation
import UIKit

protocol SettingViewControllerDelegate {
    
}

class SettingPopUpViewController: UIViewController {
    
    let popUpView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let settingUserButton: UIButton = {
        let button = UIButton()
        button.setTitle("인원 관리하기", for: .normal)
        button.titleLabel?.font = .nanumSquareNeoBold(size: 17)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
//    let popUpStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .vertical
//        stackView.alignment = .center
//        stackView.distribution = .fillProportionally
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
    
    var delegate: SettingViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        setUI()
    }
}

extension SettingPopUpViewController {
    
    func setUI() {
//        popUpStackView.addSubview(settingUserButton)
        self.view.addSubview(popUpView)
        self.view.addSubview(settingUserButton)
        setLayout()
    }
    
    func setLayout() {
        popUpView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        popUpView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        popUpView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        popUpView.heightAnchor.constraint(equalToConstant: 50).isActive = true // 스택뷰에 버튼 추가할 때마다 constant +50
        
        settingUserButton.centerXAnchor.constraint(equalTo: popUpView.centerXAnchor).isActive = true // 중앙 정렬 추가
        settingUserButton.centerYAnchor.constraint(equalTo: popUpView.centerYAnchor).isActive = true // 중앙 정렬 추가
        settingUserButton.leadingAnchor.constraint(equalTo: popUpView.leadingAnchor).isActive = true
        settingUserButton.trailingAnchor.constraint(equalTo: popUpView.trailingAnchor).isActive = true
        
        self.view.layoutIfNeeded()
    }
}
