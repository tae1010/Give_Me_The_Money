//
//  ViewController.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/03/12.
//

import UIKit

class ViewController: UIViewController {

    let mainTabbar = MainTabbar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("test")
        self.view.backgroundColor = UIColor.white
        configureTabbar()
        
    }


}

// MARK: configure MainView
extension ViewController {
    func configureTabbar() {
        self.mainTabbar.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.mainTabbar)
        
        self.mainTabbar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        self.mainTabbar.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
    }
}

