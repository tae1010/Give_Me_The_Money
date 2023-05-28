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
        label.font = .nanumSquareNeoBold(size: 15)
        return label
    }()
    
    let priceTextField = CustomNumberTextField()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
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
        
        personLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        personLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        personLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        personLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        priceTextField.topAnchor.constraint(equalTo: personLabel.topAnchor).isActive = true
        priceTextField.bottomAnchor.constraint(equalTo: personLabel.bottomAnchor).isActive = true
        priceTextField.leadingAnchor.constraint(equalTo: personLabel.trailingAnchor, constant: AppConstants.setupWidthExtraConstantSize(size: 15)).isActive = true
        priceTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
}
