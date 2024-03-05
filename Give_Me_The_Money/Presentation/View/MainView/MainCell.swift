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
        label.textColor = .black
        label.font = UIFont.nanumSquareNeoExtrabold(size: 19)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()
        
    let totalPrice: UILabel = {
        let label = UILabel()
        label.text = "$ 00,000,000"
        label.textColor = .black
        label.font = UIFont.nanumSquareNeoHeavy(size: 27)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()
    
    let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .veryLightGrey
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let editLabel: UILabel = {
        let label = UILabel()
        label.text = "Edit"
        label.textColor = .primaryColor
        label.font = UIFont.nanumSquareNeoHeavy(size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()
    
    let trashImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "trash")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let rightImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "right")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let statusImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "gameCellImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.backgroundColor = .white
           
        contentView.addSubview(titleLabel)
        contentView.addSubview(totalPrice)
        contentView.addSubview(lineView)
        contentView.addSubview(editLabel)
        contentView.addSubview(trashImage)
        contentView.addSubview(rightImage)
        
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: AppConstants.setupNormalConstantSize(size: 15)).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: AppConstants.setupNormalConstantSize(size: 20)).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trashImage.leadingAnchor, constant: AppConstants.setupNormalConstantSize(size: -20)).isActive = true

        totalPrice.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        totalPrice.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        totalPrice.trailingAnchor.constraint(equalTo: trashImage.trailingAnchor).isActive = true
        
        trashImage.topAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true
        trashImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: AppConstants.setupNormalConstantSize(size: -20)).isActive = true
        trashImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
        trashImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        rightImage.centerYAnchor.constraint(equalTo: editLabel.centerYAnchor).isActive = true
        rightImage.trailingAnchor.constraint(equalTo: trashImage.trailingAnchor).isActive = true
        rightImage.widthAnchor.constraint(equalToConstant: 15).isActive = true
        rightImage.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        lineView.topAnchor.constraint(equalTo: totalPrice.bottomAnchor, constant: 35).isActive = true
        lineView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        lineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        editLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 17).isActive = true
        editLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        editLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: AppConstants.setupNormalConstantSize(size: -17)).isActive = true
        
        layer.masksToBounds = false
        layer.shadowOpacity = 0.3
        layer.shadowColor = UIColor.lightGray.cgColor
//        layer.shadowOffset = CGSize(width: -2, height: 0)
        layer.shadowRadius = 10
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
