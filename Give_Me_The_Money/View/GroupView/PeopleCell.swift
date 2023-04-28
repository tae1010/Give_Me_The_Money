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
//        label.lineBreakMode = .byCharWrapping
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(titleLabel)
        contentView.backgroundColor = .noSelectColor
        
        layer.masksToBounds = true
        layer.cornerRadius = AppConstants.setupExtraConstantSize(size: 10)
        

//        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
//        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
//        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
//        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
//        titleLabel.setContentHuggingPriority(.required, for: .vertical)
        
        
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
//    func configure(text: String) {
//        titleLabel.text = text
//        contentView.widthAnchor.constraint(equalToConstant: titleLabel.intrinsicContentSize.width + 20).isActive = true
//        titleLabel.sizeToFit()
//        layoutIfNeeded()
//    }
}

