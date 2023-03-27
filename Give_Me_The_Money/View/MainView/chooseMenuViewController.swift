//
//  chooseMenuViewController.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/03/23.
//

import Foundation
import UIKit

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setUI()
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
        
        self.gameAddButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.gameAddButton.topAnchor.constraint(equalTo: self.chooseMenuTitleLabel.bottomAnchor, constant: AppConstants.setupConstantSize(size: 34)).isActive = true
        
        self.groupAddButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.groupAddButton.topAnchor.constraint(equalTo: self.gameAddButton.bottomAnchor, constant: AppConstants.setupConstantSize(size: 20)).isActive = true
        
        self.makeButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.makeButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.makeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }

}
