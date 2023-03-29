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
