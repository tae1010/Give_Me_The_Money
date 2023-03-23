//
//  chooseMenuViewController.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/03/23.
//

import Foundation
import UIKit

class ChooseMenuViewController: UIViewController {
    
    let gameAddButton = SideAddButton(buttonMode: .game)
    let groupAddButton = SideAddButton(buttonMode: .group)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setUI()
    }
}


extension ChooseMenuViewController {
    
    func setUI() {
        self.view.addSubview(gameAddButton)
        self.view.addSubview(groupAddButton)
        
        self.gameAddButton.translatesAutoresizingMaskIntoConstraints = false
        self.groupAddButton.translatesAutoresizingMaskIntoConstraints = false
        
        setGameAddButtonLayout()
        setGroupAddButtonLayout()
    }
    
    func setGameAddButtonLayout() {
        self.gameAddButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.gameAddButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    }
    
    func setGroupAddButtonLayout() {
        self.groupAddButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.groupAddButton.topAnchor.constraint(equalTo: self.gameAddButton.bottomAnchor, constant: 25).isActive = true
    }
}
