//
//  PeopleCell.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/04/16.
//

import Foundation
import UIKit

class PeopleCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "사용자"
        label.font = UIFont.nanumSquareNeoExtrabold(size: 14)
        label.textColor = .gray
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(titleLabel)
        contentView.backgroundColor = .noSelectColor
        
        layer.masksToBounds = true
        layer.cornerRadius = AppConstants.setupExtraConstantSize(size: 10)
        
        titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

