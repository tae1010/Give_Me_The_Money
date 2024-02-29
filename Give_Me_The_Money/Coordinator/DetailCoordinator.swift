//
//  DetailCoordinator.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2/29/24.
//

import Foundation

protocol DetailCoordinatorDelegate {
    func popViewController()
    func pushToMakeGroupViewController()
}

class DetailCoordinator: BaseCoordinator, DetailViewControllerDelegate   {

    
    
    // MARK: - Property

    var delegate: DetailCoordinatorDelegate?

    // MARK: - Start
    
    override func start() {
        let detailVC = DetailViewController()
        detailVC.delegate = self
        detailVC.modalPresentationStyle = .overCurrentContext
        navigationController.pushViewController(detailVC, animated: false)
    }
    
    func pushToMakeGroupViewController() {
        delegate?.pushToMakeGroupViewController()
    }
    
    // MARK: - Method
    func popViewController() {
        delegate?.popViewController()
    }
}

