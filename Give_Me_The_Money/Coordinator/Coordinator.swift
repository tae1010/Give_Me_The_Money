//
//  Coordinator.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/03/28.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}

class BaseCoordinator: Coordinator {
    
    // MARK: - Property
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    // MARK: - Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Start

    func start() {}
}
