//
//  MainTabbar.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/03/13.
//

import Foundation
import UIKit
import SnapKit

class MainTabbar: UIView {
    
    let button = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureButton()
    }
    
}


// MARK: configureView
extension MainTabbar {
    
    func configureButton() {
        self.button.setTitle("ㅁㄴㅇㅁㄴㅇㅁ", for: .normal)
        self.button.setImage(UIImage(named: "person"), for: .normal)
        self.button.setTitleColor(UIColor.black, for: .normal)
        self.button.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(button)
        
        
        self.button.translatesAutoresizingMaskIntoConstraints = false
        self.button.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        self.button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        self.button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        self.button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    }
    
}
