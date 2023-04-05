//
//  File.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/03/31.
//

import Foundation
import UIKit

class MainCell: UICollectionViewCell {
    
    let totalPrice: UILabel = {
        let label = UILabel()
        label.text = "0원"
        label.font = UIFont.nanumSquareNeoHeavy(size: 25)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "user")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let userCountLabel: UILabel = {
        let label = UILabel()
        label.text = "0명"
        label.font = UIFont.nanumSquareNeoExtrabold(size: 13)
        label.textColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "23.01.01 ~ 23.01.01"
        label.font = UIFont.nanumSquareNeoExtrabold(size: 13)
        label.textColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    let usageLabelView = UsageLabelView(text: "여행")
    
    let titleLabel = UsageLabelView(text: "2021 회사 회의asdasdasdasdasdasd")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(usageLabelView)
        contentView.addSubview(totalPrice)
        contentView.addSubview(userImageView)
        contentView.addSubview(userCountLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(titleLabel)
        
        contentView.backgroundColor = .white
        
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: -2, height: 2)
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 5
        
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 10
        
        usageLabelView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: AppConstants.setupConstantSize(size: 20)).isActive = true
        usageLabelView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: AppConstants.setupConstantSize(size: 20)).isActive = true
        usageLabelView.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        titleLabel.centerYAnchor.constraint(equalTo: usageLabelView.centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: usageLabelView.trailingAnchor, constant: AppConstants.setupConstantSize(size: 7)).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -AppConstants.setupConstantSize(size: 20)).isActive = true
        titleLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        
        totalPrice.topAnchor.constraint(equalTo: usageLabelView.bottomAnchor, constant: AppConstants.setupConstantSize(size: 15)).isActive = true
        totalPrice.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -35).isActive = true
        
        
        userImageView.leadingAnchor.constraint(equalTo: usageLabelView.leadingAnchor).isActive = true
        userImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        
        
        userCountLabel.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor).isActive = true
        userCountLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: AppConstants.setupConstantSize(size: 5)).isActive = true
        
        dateLabel.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: AppConstants.setupConstantSize(size: -20)).isActive = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
