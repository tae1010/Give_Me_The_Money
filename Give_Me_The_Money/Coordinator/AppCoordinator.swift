//
//  AppCoordinator.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2024/02/02.
//

import Foundation
import UIKit


class AppCoordinator: BaseCoordinator, MainCoordinatorDelegate, SetTitleCoordinatorDelegate, SettingCoordinatorDelegate {
    
    override func start() {
        showMainViewController()
    }
    
    func showMainViewController() {
        let coordinator = MainCoordinator(navigationController: navigationController)
        coordinator.delegate = self
        coordinator.start()
        childCoordinators.append(coordinator)
    }
    
    func pushToSetTitleViewController() {
        let coordinator = SetTitleCoordinator(navigationController: navigationController)
        coordinator.delegate = self
        coordinator.start()
        childCoordinators.append(coordinator)
    }
    
    func pushToSettingViewController() {
        let coordinator = SettingCoordinator(navigationController: navigationController)
        coordinator.delegate = self
        coordinator.start()
        childCoordinators.append(coordinator)
    }
        
    func popViewController() {
        navigationController.dismiss(animated: true)
        childCoordinators.removeLast()
    }
}
