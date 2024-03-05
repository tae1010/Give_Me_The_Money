//
//  UserSettingCoordinator.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2024/02/19.
//

import Foundation

protocol UserPreSetCoordinatorDelegate {
    func dismissToMainViewController()
    func presentViewDismissAndStart()
    func pushToUserSettingViewController()
}

class UserPreSetCoordinator: BaseCoordinator, UserPreSetViewControllerDelegate {
    
    var delegate: UserPreSetCoordinatorDelegate?
    
    // MARK: - Start
    
    override func start() {
        let userPreSetVC = UserPreSetPopUpViewController()
        userPreSetVC.delegate = self
        userPreSetVC.modalPresentationStyle = .overCurrentContext
        navigationController.present(userPreSetVC, animated: false)
    }
    
    func presentViewDismissAndStart() {
        delegate?.presentViewDismissAndStart()
    }

    func dismissToMainViewController() {
        delegate?.dismissToMainViewController()
    }
    
    func presentToUserSettingViewController() {
        delegate?.pushToUserSettingViewController()
    }
    
}
