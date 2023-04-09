//
//  usageLabelView.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/04/05.
//

import Foundation
import UIKit

class UsageLabelView: UIView {
    
    
    let usageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.nanumSquareNeoExtrabold(size: 14)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    init(text: String, backGroundColor: UIColor, labelColor: UIColor) {
        super.init(frame: .zero)
        
        addSubview(usageLabel)
        
        usageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        usageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        usageLabel.text = text
        usageLabel.textColor = labelColor
        self.backgroundColor = backGroundColor
        self.layer.cornerRadius = AppConstants.setupNormalConstantSize(size: 15)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: AppConstants.setupExtraConstantSize(size: 30)).isActive = true
    }

}

