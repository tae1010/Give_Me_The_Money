//
//  chooseMenuViewController.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/03/23.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

enum SideButtonMode {
    case game
    case group
}

class ChooseMenuViewController: UIViewController {
    
    let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "closeButton"), for: .normal)
        return button
    }()
    
    let chooseMenuTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "메뉴 선택"
        label.textAlignment = .center
        label.font = UIFont.nanumGothicBold(size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let gameAddButton = SideAddButton(buttonMode: .game)
    let groupAddButton = SideAddButton(buttonMode: .group)
    let makeButton = MainButton(title: "만들기")
    
    private var chooseMenuViewModel: ChooseMenuViewModel
    let disposeBag = DisposeBag()
    
    let tapGameButtonGesture = UITapGestureRecognizer()
    let tapGroupButtonGesture = UITapGestureRecognizer()

    init(chooseMenuViewModel: ChooseMenuViewModel) {
        self.chooseMenuViewModel = chooseMenuViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setUI()
        configureUI()
        
        tapGroupButtonGesture.rx.event.bind(onNext: { _ in
            self.chooseMenuViewModel.sideMenuStatus.accept(.group)
        }).disposed(by: disposeBag)

        
        tapGameButtonGesture.rx.event.bind(onNext: { _ in
            self.chooseMenuViewModel.sideMenuStatus.accept(.game)
//            self.gameAddButton.changeButtonUI()
            
        }).disposed(by: disposeBag)
        
        
    }
}


extension ChooseMenuViewController {
    
    func setUI() {
        self.view.addSubview(closeButton)
        self.view.addSubview(gameAddButton)
        self.view.addSubview(groupAddButton)
        self.view.addSubview(chooseMenuTitleLabel)
        self.view.addSubview(makeButton)

        setLayOut()
    }
    
    func setLayOut() {
        
        self.closeButton.translatesAutoresizingMaskIntoConstraints = false
        self.chooseMenuTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.gameAddButton.translatesAutoresizingMaskIntoConstraints = false
        self.groupAddButton.translatesAutoresizingMaskIntoConstraints = false
        self.makeButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.closeButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: AppConstants.setupConstantSize(size: 20)).isActive = true
        self.closeButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: AppConstants.setupConstantSize(size: 20)).isActive = true
        
        self.chooseMenuTitleLabel.leadingAnchor.constraint(equalTo: self.closeButton.leadingAnchor).isActive = true
        self.chooseMenuTitleLabel.topAnchor.constraint(equalTo: self.closeButton.bottomAnchor, constant: AppConstants.setupConstantSize(size: 24)).isActive = true
        
        self.groupAddButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.groupAddButton.topAnchor.constraint(equalTo: self.chooseMenuTitleLabel.bottomAnchor, constant: AppConstants.setupConstantSize(size: 34)).isActive = true
        
        self.gameAddButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.gameAddButton.topAnchor.constraint(equalTo: self.groupAddButton.bottomAnchor, constant: AppConstants.setupConstantSize(size: 20)).isActive = true
        
        self.makeButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.makeButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.makeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    func configureUI() {
        gameAddButton.isUserInteractionEnabled = true
        gameAddButton.addGestureRecognizer(tapGameButtonGesture)
        
        groupAddButton.isUserInteractionEnabled = true
        groupAddButton.addGestureRecognizer(tapGroupButtonGesture)
    }

}
