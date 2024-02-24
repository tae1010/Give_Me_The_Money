//
//  UserPreSetViewController.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2024/02/14.
//

import Foundation
import UIKit
import RxSwift

protocol UserPreSetViewControllerDelegate {
    func dismissToMainViewController()
    func presentToUserSettingViewController()
}

class UserPreSetPopUpViewController: UIViewController {
    
    let popUpView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let firstPreset: UIButton = {
        let button = UIButton()
        button.setTitle("프리셋1", for: .normal)
        button.titleLabel?.font = .nanumSquareNeoBold(size: 17)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let secondPreset: UIButton = {
        let button = UIButton()
        button.setTitle("프리셋2", for: .normal)
        button.titleLabel?.font = .nanumSquareNeoBold(size: 17)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let thirdPreset: UIButton = {
        let button = UIButton()
        button.setTitle("프리셋3", for: .normal)
        button.titleLabel?.font = .nanumSquareNeoBold(size: 17)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    var delegate: UserPreSetViewControllerDelegate?
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        setUI()
        
        let tapBackGroundViewGesture = UITapGestureRecognizer()
        self.view.addGestureRecognizer(tapBackGroundViewGesture)
        
        tapBackGroundViewGesture.rx.event.bind(onNext: { recognizer in
            self.delegate?.dismissToMainViewController()
        }).disposed(by: disposeBag)
        
        
        
        [firstPreset, secondPreset, thirdPreset].map {
            $0.rx.tap.bind(onNext: {
                self.dismiss(animated: true) {
                    self.delegate?.presentToUserSettingViewController()
                }
            }).disposed(by: disposeBag)
        }
    }
    
}

extension UserPreSetPopUpViewController {
    
    func setUI() {
        self.view.addSubview(popUpView)
        self.view.addSubview(firstPreset)
        self.view.addSubview(secondPreset)
        self.view.addSubview(thirdPreset)
        setLayout()
    }
    
    func setLayout() {
        popUpView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        popUpView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        popUpView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        popUpView.heightAnchor.constraint(equalToConstant: 150).isActive = true // 스택뷰에 label 추가할 때마다 constant +50
        
        firstPreset.topAnchor.constraint(equalTo: popUpView.topAnchor).isActive = true
        firstPreset.leadingAnchor.constraint(equalTo: popUpView.leadingAnchor).isActive = true
        firstPreset.trailingAnchor.constraint(equalTo: popUpView.trailingAnchor).isActive = true
        firstPreset.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        secondPreset.topAnchor.constraint(equalTo: firstPreset.bottomAnchor).isActive = true
        secondPreset.leadingAnchor.constraint(equalTo: popUpView.leadingAnchor).isActive = true
        secondPreset.trailingAnchor.constraint(equalTo: popUpView.trailingAnchor).isActive = true
        secondPreset.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        thirdPreset.topAnchor.constraint(equalTo: secondPreset.bottomAnchor).isActive = true
        thirdPreset.leadingAnchor.constraint(equalTo: popUpView.leadingAnchor).isActive = true
        thirdPreset.trailingAnchor.constraint(equalTo: popUpView.trailingAnchor).isActive = true
        thirdPreset.bottomAnchor.constraint(equalTo: popUpView.bottomAnchor).isActive = true
    }
}
