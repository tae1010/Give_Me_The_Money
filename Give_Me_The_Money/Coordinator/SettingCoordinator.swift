//
//  SettingCoordinator.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2024/02/05.
//

import Foundation

protocol SettingCoordinatorDelegate {
    func popViewController()
}

class SettingCoordinator: BaseCoordinator, SettingViewControllerDelegate {
    
    var delegate: SettingCoordinatorDelegate?

    // MARK: - Start
    
    override func start() {
        let settingVC = SettingPopUpViewController()
        print("눌렀")
        settingVC.delegate = self
        settingVC.modalPresentationStyle = .overCurrentContext
        navigationController.present(settingVC, animated: false)
    }
    
    func popViewController() {
        delegate?.popViewController()
    }
    
    func dismissToMainViewController() {
        delegate?.popViewController()
    }
    
}
