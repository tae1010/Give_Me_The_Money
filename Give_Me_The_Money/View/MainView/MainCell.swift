//
//  File.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/03/31.
//

import Foundation
import UIKit

class MainCell: UICollectionViewCell {
    
    let usageLabel: UILabel = {
        let label = UILabel()
        label.text = "test"
        label.font = UIFont.nanumSquareNeoBold(size: 15)
        label.backgroundColor = UIColor.lightGray
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(usageLabel)
        contentView.addSubview(totalPrice)
        contentView.addSubview(userImageView)
        
        contentView.backgroundColor = .white
        
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: -2, height: 2)
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 5
        
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        
        
        usageLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        usageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40).isActive = true
        
        
        totalPrice.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        totalPrice.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40).isActive = true
        
        
        userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40).isActive = true
        userImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
