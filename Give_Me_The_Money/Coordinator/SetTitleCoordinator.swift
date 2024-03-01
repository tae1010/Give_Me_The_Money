//
//  SetTitleCoordinator.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2024/02/02.
//

import Foundation
import UIKit

protocol SetTitleCoordinatorDelegate {
    func dismissViewController()
    func pushToMakeGroupViewController()
}

class SetTitleCoordinator: BaseCoordinator, SetTitleViewControllerDelegate {
    
    var delegate: SetTitleCoordinatorDelegate?

    // MARK: - Start
    
    override func start() {
        let setTitleVC = SetTitleViewController()
        setTitleVC.delegate = self
        setTitleVC.modalPresentationStyle = .overCurrentContext
        navigationController.present(setTitleVC, animated: false)
    }
    
    func pushToMakeGroupViewController() {
        delegate?.pushToMakeGroupViewController()
    }
    
    func popViewController() {
        delegate?.dismissViewController()
    }
    
    func dismissToMainViewController() {
        delegate?.dismissViewController()
    }
    
}
