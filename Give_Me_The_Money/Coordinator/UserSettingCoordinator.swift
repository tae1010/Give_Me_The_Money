//
//  UserSettingCoordinator.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2024/02/19.
//

import Foundation

protocol UserSettingCoordinatorDelegate {
    func dismissUserSettingView()
}

class UserSettingCoordinator: BaseCoordinator, UserSettingViewControllerDelegate {

    var delegate: UserSettingCoordinatorDelegate?
    
    // MARK: - Start
    
    override func start() {
        let userSettingVC = UserSettingViewController()
        userSettingVC.delegate = self
        userSettingVC.modalPresentationStyle = .overCurrentContext
        navigationController.present(userSettingVC, animated: false)
    }
    
    func dismissToUSerSettingView() {
        delegate?.dismissUserSettingView()
    }
    
}
