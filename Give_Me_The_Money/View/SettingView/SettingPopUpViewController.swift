//
//  SettingPopupViewController.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2024/02/05.
//

import Foundation
import UIKit
import RxSwift

protocol SettingViewControllerDelegate {
    func presentToUserPresetPopUpViewController()
    func dismissToMainViewController()
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
    
    let settingUsageButton: UIButton = {
        let button = UIButton()
        button.setTitle("용도 관리하기", for: .normal)
        button.titleLabel?.font = .nanumSquareNeoBold(size: 17)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var delegate: SettingViewControllerDelegate?
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        setUI()
        
        let tapBackGroundViewGesture = UITapGestureRecognizer()
        self.view.addGestureRecognizer(tapBackGroundViewGesture)
        
        tapBackGroundViewGesture.rx.event.bind(onNext: { recognizer in
            self.delegate?.dismissToMainViewController()
        }).disposed(by: disposeBag)
        
        settingUserButton.rx.tap.bind(onNext: {
            self.dismiss(animated: true) {
                self.delegate?.presentToUserPresetPopUpViewController()
            }
        }).disposed(by: disposeBag)
    }
}

extension SettingPopUpViewController {
    
    func setUI() {
        self.view.addSubview(popUpView)
        self.view.addSubview(settingUserButton)
        self.view.addSubview(settingUsageButton)
        setLayout()
    }
    
    func setLayout() {
        popUpView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        popUpView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        popUpView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        popUpView.heightAnchor.constraint(equalToConstant: 100).isActive = true // 스택뷰에 버튼 추가할 때마다 constant +50
        
        settingUserButton.topAnchor.constraint(equalTo: popUpView.topAnchor).isActive = true
        settingUserButton.leadingAnchor.constraint(equalTo: popUpView.leadingAnchor).isActive = true
        settingUserButton.trailingAnchor.constraint(equalTo: popUpView.trailingAnchor).isActive = true
        settingUserButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        settingUsageButton.topAnchor.constraint(equalTo: settingUserButton.bottomAnchor).isActive = true
        settingUsageButton.leadingAnchor.constraint(equalTo: popUpView.leadingAnchor).isActive = true
        settingUsageButton.trailingAnchor.constraint(equalTo: popUpView.trailingAnchor).isActive = true
        settingUsageButton.bottomAnchor.constraint(equalTo: popUpView.bottomAnchor).isActive = true
    }
}
