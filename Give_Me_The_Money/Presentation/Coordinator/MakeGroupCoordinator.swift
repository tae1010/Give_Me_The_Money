//
//  MakeGroupCoordinator.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2/29/24.
//

import Foundation
import UIKit

protocol MakeGroupCoordinatorDelegate {
    func dismissViewController()
}

class MakeGroupCoordinator: BaseCoordinator, MakeGroupViewControllerDelegate {
    
    var delegate: MakeGroupCoordinatorDelegate?

    // MARK: - Start
    
    override func start() {
        let makeGroupVC = MakeGroupViewController()
        makeGroupVC.delegate = self
        makeGroupVC.modalPresentationStyle = .overCurrentContext
        navigationController.present(makeGroupVC, animated: false)
    }
    
    func dismissToViewController() {
        delegate?.dismissViewController()
    }
    
}
