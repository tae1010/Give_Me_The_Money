//
//  MainCell.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/04/08.
//

import Foundation
import UIKit

class MainCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "여행"
        label.font = UIFont.nanumSquareNeoHeavy(size: 15)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    let totalPrice: UILabel = {
        let label = UILabel()
        label.text = "00,000,000원"
        label.font = UIFont.nanumSquareNeoBold(size: 13)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let myPrice: UILabel = {
        let label = UILabel()
        label.text = "00,000,000원"
        label.font = UIFont.nanumSquareNeoBold(size: 13
        )
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let statusImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "gameCellImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let priceStatusStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = AppConstants.setupExtraConstantSize(size: 10)
        stackView.alignment = .leading
        stackView.distribution = .fillEqually

        return stackView
    }()
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
           
        contentView.addSubview(statusImage)
        contentView.addSubview(titleLabel)
        self.priceStatusStackView.addArrangedSubview(totalPrice)
        self.priceStatusStackView.addArrangedSubview(myPrice)
        contentView.addSubview(priceStatusStackView)
        
        contentView.backgroundColor = .lightPrimaryColor
        
        layer.masksToBounds = true
        layer.cornerRadius = AppConstants.setupExtraConstantSize(size: 10)
        
        
        statusImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: self.frame.height / AppConstants.setupNormalMultiplierSize(size: 3)).isActive = true
        statusImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: AppConstants.setupWidthConstantSize(size: 20)).isActive = true
        statusImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        statusImage.widthAnchor.constraint(equalTo: statusImage.heightAnchor).isActive = true
        
        
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: statusImage.trailingAnchor, constant: AppConstants.setupWidthConstantSize(size: 10)).isActive = true

 
        priceStatusStackView.leadingAnchor.constraint(greaterThanOrEqualTo: titleLabel.trailingAnchor, constant: 10).isActive = true
        
        priceStatusStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        priceStatusStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: AppConstants.setupWidthConstantSize(size: -20)).isActive = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
