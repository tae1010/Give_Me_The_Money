//
//  ViewController.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/03/12.
//

import UIKit

enum TapMainButtonStatus {
    case show
    case nonShow
}

class ViewController: UIViewController {

    let mainAddButton = MainAddButton()
    lazy var gameAddButton = SideAddButton()
    lazy var groupAddButton = SideAddButton()
    
    var tapMainButtonStatus: TapMainButtonStatus = .nonShow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
        mainAddButton.addTarget(self, action: #selector(setBtnTap), for: .touchUpInside)
    }
    
    @objc
        func setBtnTap() {
            if tapMainButtonStatus == .nonShow {
                gameAddButton.isHidden = true
                groupAddButton.isHidden = true
                
                tapMainButtonStatus = .show
            } else{
                gameAddButton.isHidden = false
                groupAddButton.isHidden = false
                
                tapMainButtonStatus = .nonShow
            }
            print("setBtnTap")
        }
    
}

// MARK: configure MainView
extension ViewController {
    
    func configureView() {
        configureMainAddButton()
        configureGameAddButton()
        configureGroupAddButton()
    }
    
    func configureMainAddButton() {

        self.view.addSubview(self.mainAddButton)
        self.mainAddButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.mainAddButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        self.mainAddButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true

    }
    
    func configureGameAddButton() {
        self.view.addSubview(gameAddButton)
        self.gameAddButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.gameAddButton.centerYAnchor.constraint(equalTo: self.mainAddButton.centerYAnchor, constant: -25).isActive = true
        self.gameAddButton.trailingAnchor.constraint(equalTo: self.mainAddButton.leadingAnchor, constant: -15).isActive = true
    }
    
    func configureGroupAddButton() {
        self.view.addSubview(groupAddButton)
        self.groupAddButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.groupAddButton.centerXAnchor.constraint(equalTo: self.mainAddButton.centerXAnchor, constant: -25).isActive = true
        self.groupAddButton.bottomAnchor.constraint(equalTo: self.mainAddButton.topAnchor, constant: -15).isActive = true
    }
}

