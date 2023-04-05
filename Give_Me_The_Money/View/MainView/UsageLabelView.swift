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
    
    
    init(text: String) {
        super.init(frame: .zero)
        
        addSubview(usageLabel)
        
        usageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: AppConstants.setupNormalConstantSize(size: 10)).isActive = true
        usageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: AppConstants.setupNormalConstantSize(size: -10)).isActive = true
        usageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        usageLabel.text = text
        
        self.backgroundColor = .lightPrimaryColor
        self.layer.cornerRadius = AppConstants.setupNormalConstantSize(size: 10)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: AppConstants.setupExtraConstantSize(size: 25)).isActive = true
    }

}

