//
//  SettingCoordinator.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2024/02/05.
//

import Foundation

protocol SettingCoordinatorDelegate {
    func presentToUserPresetViewController()
    func dismissToMainViewController()
}

class SettingCoordinator: BaseCoordinator, SettingViewControllerDelegate {

    var delegate: SettingCoordinatorDelegate?

    // MARK: - Start
    override func start() {
        let settingVC = SettingPopUpViewController()
        settingVC.delegate = self
        settingVC.modalPresentationStyle = .overCurrentContext
        navigationController.present(settingVC, animated: false)
    }
    
    func presentToUserPresetViewController() {
        delegate?.dismissToMainViewController() // 기존 모달 창 닫기
        delegate?.presentToUserPresetViewController()
    }
    
    func dismissToMainViewController() {
        delegate?.dismissToMainViewController()
    }
    
}
