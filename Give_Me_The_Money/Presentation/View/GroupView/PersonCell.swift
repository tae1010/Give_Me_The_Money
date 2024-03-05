//
//  File.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/05/15.
//

import Foundation
import UIKit

class PersonCell: UITableViewCell {
    
    let personLabel: UILabel = {
        let label = UILabel()
        label.text = "사람"
        label.textColor = .black
        label.font = .nanumSquareNeoBold(size: 15)
        return label
    }()
    
    let priceTextField = CustomNumberTextField()
    
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

extension PersonCell {
    
    func setUI() {
        contentView.addSubview(personLabel)
        contentView.addSubview(priceTextField)
        
        setLayout()
    }
    
    func setLayout() {
        personLabel.translatesAutoresizingMaskIntoConstraints = false
        priceTextField.translatesAutoresizingMaskIntoConstraints = false
        
        personLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        personLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        personLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        
        priceTextField.topAnchor.constraint(equalTo: personLabel.topAnchor).isActive = true
        priceTextField.leadingAnchor.constraint(equalTo: personLabel.trailingAnchor, constant: AppConstants.setupWidthExtraConstantSize(size: 15)).isActive = true
        priceTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        priceTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: AppConstants.setupExtraMultiplierSize(size: 0.6)).isActive = true
    }
}
