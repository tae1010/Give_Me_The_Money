//
//  Coordinator.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/03/28.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var parentCoordinator: Coordinator? { get set }
    func start()
    func moveToNextView()
}

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    var parentCoordinator: Coordinator?
    
    func moveToNextView() {
        //
    }
    
    var childCoordinators = [Coordinator]()
    var nav: UINavigationController
    
    init(nav: UINavigationController) {
        self.nav = nav
    }
//    
//    func start() {
//        let vc = MainViewController.instantiate(storyboardName: "Main")
//        vc.coordinator = self
//        nav.pushViewController(vc, animated: false)
//    }
//    
//    func showSecondVC() {
//        let vc = SecondViewController.instantiate(storyboardName: "Main")
//        vc.coordinator = self
//        nav.pushViewController(vc, animated: true)
//    }
}
