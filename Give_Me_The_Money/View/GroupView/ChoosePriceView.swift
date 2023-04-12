//
//  ChoosePriceView.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/04/12.
//

import Foundation
import UIKit

class ChoosePriceView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "가격"
        label.font = UIFont.nanumSquareNeoBold(size: 17)
        label.textColor = .gray
        return label
    }()
    
    let priceTextField = CustomTextField()
    
    let minusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = UIColor.lightGray
        return button
    }()
    
    let plusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.tintColor = UIColor.lightGray
        return button
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.nanumSquareNeoBold(size: 17)
        label.textColor = .gray
        
        return label
    }()
    
    let plusMinusStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = AppConstants.setupWidthConstantSize(size: 10)

        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension ChoosePriceView {
    
    func setUI() {
        
        self.addSubview(titleLabel)
        self.addSubview(priceTextField)
        self.addSubview(plusMinusStackView)
        
        [plusButton, priceLabel, minusButton].forEach({
            self.plusMinusStackView.addArrangedSubview($0)
        })
        
        setLayout()
    }
    
    func setLayout() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceTextField.translatesAutoresizingMaskIntoConstraints = false
        plusMinusStackView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        
        priceTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        priceTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: AppConstants.setupExtraConstantSize(size: 30)).isActive = true
        
        plusMinusStackView.topAnchor.constraint(equalTo: priceTextField.topAnchor).isActive = true
        plusMinusStackView.leadingAnchor.constraint(equalTo: priceTextField.trailingAnchor, constant: AppConstants.setupExtraConstantSize(size: 50)).isActive = true
        plusMinusStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: AppConstants.setupWidthConstantSize(size: -10)).isActive = true
        plusMinusStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }
}
