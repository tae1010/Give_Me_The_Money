//
//  MainCoordinator.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2024/02/02.
//

import Foundation
import UIKit

protocol MainCoordinatorDelegate {
    func pushToSetTitleViewController()
    func pushToSettingViewController()
    func pushToDetailViewController()
}

class MainCoordinator: BaseCoordinator, MainViewControllerDelegate   {

    
    
    // MARK: - Property

    var delegate: MainCoordinatorDelegate?

    // MARK: - Start
    
    override func start() {
        let mainVC = MainViewController(viewModel: GroupViewModel())
        mainVC.delegate = self
        
        navigationController.viewControllers = [mainVC]
    }
    
    // MARK: - Method
    
    func pushToDetailViewController() {
        delegate?.pushToDetailViewController()
    }
    func pushToSetTitleViewController() {
        delegate?.pushToSetTitleViewController()
    }
    
    func pushToSettingViewController() {
        delegate?.pushToSettingViewController()
    }
}

