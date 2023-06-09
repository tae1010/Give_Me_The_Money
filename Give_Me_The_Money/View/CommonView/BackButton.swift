//
//  backButton.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/04/09.
//

import Foundation
import UIKit

class BackButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setImage(UIImage(named: "backButton"), for: .normal)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
