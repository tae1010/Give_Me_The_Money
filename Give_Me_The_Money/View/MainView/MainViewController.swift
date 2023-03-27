//
//  ViewController.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/03/12.
//

import UIKit
import MaterialComponents.MaterialBottomSheet
import RxCocoa
import RxSwift

enum TapMainButtonStatus {
    case show
    case nonShow
}

class MainViewController: UIViewController {
    
    let mainAddButton = MainAddButton()
    
    let disposeBag = DisposeBag()
    
    var tapMainButtonStatus: TapMainButtonStatus = .nonShow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
        mainAddButton.rx.tap.bind(onNext: {
            
            let chooseMenuVC = ChooseMenuViewController()
            chooseMenuVC.modalPresentationStyle = .fullScreen
            
            self.present(chooseMenuVC, animated: true)
            
        }).disposed(by: disposeBag)
    }
    
    
}

// MARK: configure MainView
extension MainViewController {
    
    func configureView() {
        configureMainAddButton()
    }
    
    func configureMainAddButton() {
        
        self.view.addSubview(self.mainAddButton)
        self.mainAddButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.mainAddButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: AppConstants.setupConstantSize(size: -30)).isActive = true
        self.mainAddButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: AppConstants.setupConstantSize(size: -30)).isActive = true
        
    }
    

}

