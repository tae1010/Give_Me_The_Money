//
//  MainButton.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/03/23.
//

import Foundation
import UIKit

class MainButton: UIButton {
    
    override init(frame: CGRect) {
        // set myValue before super.init is called
        
        super.init(frame: frame)
        
        // set other operations after super.init, if required
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    

}
