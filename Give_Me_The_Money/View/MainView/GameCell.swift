//
//  File.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/03/31.
//

import Foundation
import UIKit

class GameCell: UICollectionViewCell {
    
    let usageLabel: UILabel = {
        let label = UILabel()
        label.text = "test"
        label.font = UIFont.nanumSquareNeoBold(size: 15)
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
        self.addSubview(self.usageLabel)
        self.addSubview(userImageView)
       
        
        
        usageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        usageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        userImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        userImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
