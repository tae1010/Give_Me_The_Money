//
//  MainStatusView.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/04/03.
//

import Foundation
import UIKit

class MainStatusView: UIView {
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .primaryColor
        self.layer.cornerRadius = AppConstants.setupNormalConstantSize(size: 20)
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
