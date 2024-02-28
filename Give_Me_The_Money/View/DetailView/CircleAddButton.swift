//
//  MainTabbar.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/03/13.
//

import Foundation
import UIKit

class CircleAddButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureAddButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}


// MARK: configureView
extension CircleAddButton {
    
    // add Button 모양 지정
    func configureAddButton() {
        
        self.setImage(UIImage(named: "AddButton"), for: .normal)
        self.backgroundColor = .primaryColor
//        self.tintColor = .white
        self.showsTouchWhenHighlighted = false
         
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.widthAnchor.constraint(equalToConstant: AppConstants.ScreenHeight * 0.09).isActive = true
        self.heightAnchor.constraint(equalTo: self.widthAnchor).isActive = true

        self.layer.cornerRadius = AppConstants.ScreenHeight * 0.09 / 2
        self.layer.masksToBounds = true
        
        self.layer.shadowColor = UIColor.black.cgColor // 색깔
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        self.layer.shadowRadius = 5 // 반경
        self.layer.shadowOpacity = 0.3 // alpha값

    }
    
}

