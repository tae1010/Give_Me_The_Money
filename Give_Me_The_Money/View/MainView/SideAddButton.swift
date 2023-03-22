//
//  sideAddButton.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/03/22.
//

import Foundation
import UIKit
import SnapKit

class SideAddButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSideAddButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
}


// MARK: configureView
extension SideAddButton {
    
    // add Button 모양 지정
    func configureSideAddButton() {
        
        self.setImage(UIImage(named: "AddButton"), for: .normal)
        self.backgroundColor = .primaryColor
//        self.tintColor = .white
        self.showsTouchWhenHighlighted = false
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.widthAnchor.constraint(equalToConstant: AppConstants.ScreenWidth * 0.12).isActive = true
        self.heightAnchor.constraint(equalTo: self.widthAnchor).isActive = true

        self.layer.cornerRadius = AppConstants.ScreenWidth * 0.12 / 2
        self.layer.masksToBounds = true
        
        self.layer.shadowColor = UIColor.black.cgColor // 색깔
        self.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        self.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        self.layer.shadowRadius = 5 // 반경
        self.layer.shadowOpacity = 0.3 // alpha값
        
    }
    
}
