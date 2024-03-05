//
//  SettingCell.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2024/02/19.
//

import Foundation
import UIKit

class SettingCell: UITableViewCell {
    
    let personLabel: UILabel = {
        let label = UILabel()
        label.text = "사람"
        label.textColor = .black
        label.font = .nanumSquareNeoBold(size: 17)
        return label
    }()

    let checkImage: UIImageView = {
        let logoView = UIImageView()
        logoView.image = UIImage(named: "check")
        return logoView
    }()
    
    let nonCheckImage: UIImageView = {
        let logoView = UIImageView()
        logoView.image = UIImage(named: "nonCheck")
        return logoView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .white
        setUI()
        print(self.frame.height)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension SettingCell {
    
    func setUI() {
        contentView.addSubview(personLabel)
        contentView.addSubview(nonCheckImage)
        
        setLayout()
    }
    
    func setLayout() {
        personLabel.translatesAutoresizingMaskIntoConstraints = false
        nonCheckImage.translatesAutoresizingMaskIntoConstraints = false
        
        personLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        personLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        personLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        
        nonCheckImage.centerYAnchor.constraint(equalTo: personLabel.centerYAnchor).isActive = true
        nonCheckImage.leadingAnchor.constraint(equalTo: personLabel.trailingAnchor, constant: AppConstants.setupWidthExtraConstantSize(size: 15)).isActive = true
        nonCheckImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        nonCheckImage.widthAnchor.constraint(equalToConstant: 18).isActive = true
        nonCheckImage.heightAnchor.constraint(equalToConstant: 18).isActive = true
//        nonCheckImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: AppConstants.setupExtraMultiplierSize(size: 0.6)).isActive = true
    }
    
}
