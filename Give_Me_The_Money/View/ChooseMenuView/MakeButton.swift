//
//  MainButton.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/03/23.
//

import Foundation
import UIKit

class MakeButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    init(title: String, isEnabled: Bool) {
        super.init(frame: .zero)
        
        let isiPad = UIDevice.current.userInterfaceIdiom == .pad
        let constantSize: CGFloat = isiPad ? 90: 75
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = isEnabled ? .primaryColor : .gray
        self.setTitleColor(isEnabled ? .white : .black, for: .normal)
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = .nanumSquareNeoBold(size: 15)
        self.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 10.0, right: 0.0)
        self.heightAnchor.constraint(equalToConstant: AppConstants.setupNormalConstantSize(size: constantSize)).isActive = true
    }

    

}
