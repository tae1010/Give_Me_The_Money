//
//  UsageCell.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2/27/24.
//

import Foundation
import UIKit

class UsageCell: UICollectionViewCell {
    
    let usageLabel: UILabel = {
        let label = UILabel()
        label.text = "용도"
        label.textColor = .gray
        label.font = UIFont.nanumSquareNeoExtrabold(size: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.backgroundColor = .white
        contentView.addSubview(usageLabel)
        
        usageLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: AppConstants.setupWidthConstantSize(size: 20)).isActive = true
        usageLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        usageLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        
        self.contentView.backgroundColor = .noSelectColor
        self.contentView.layer.cornerRadius = AppConstants.setupNormalConstantSize(size: 15)
        self.contentView.heightAnchor.constraint(equalToConstant: AppConstants.setupExtraConstantSize(size: 30)).isActive = true
    }
    
//    init(text: String) {
//        super.init(frame: .zero)
//        
//        self.contentView.backgroundColor = .white
//        contentView.addSubview(usageLabel)
//        
//        usageLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: AppConstants.setupWidthConstantSize(size: 20)).isActive = true
//        usageLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
//        usageLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
//        
//        usageLabel.text = text
//        usageLabel.textColor = .gray
//        self.contentView.backgroundColor = .noSelectColor
//        self.contentView.layer.cornerRadius = AppConstants.setupNormalConstantSize(size: 15)
//        self.contentView.heightAnchor.constraint(equalToConstant: AppConstants.setupExtraConstantSize(size: 30)).isActive = true
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
