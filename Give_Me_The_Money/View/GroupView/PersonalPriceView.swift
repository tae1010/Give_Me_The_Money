//
//  PersonalPriceView.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/04/28.
//

import Foundation
import UIKit

class PersonPricevView: UIView {
    
    let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = AppConstants.setupWidthConstantSize(size: 10)

        return stackView
    }()

    
    let sameButton: UIButton = {
        let button = UIButton()
        button.setTitle("균등", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.nanumSquareNeoBold(size: 13)
        button.backgroundColor = .veryLightGrey
        button.layer.cornerRadius = AppConstants.setupExtraConstantSize(size: 10)
        
        
        return button
    }()
    
    
    let gameButton: UIButton = {
        let button = UIButton()
        button.setTitle("내기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.nanumSquareNeoBold(size: 13)
        button.backgroundColor = .veryLightGrey
        button.layer.cornerRadius = AppConstants.setupExtraConstantSize(size: 10)
        return button
    }()
    
    let leftPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "남은 금액 : "
        label.font = UIFont.nanumSquareNeoBold(size: 15)
        label.textColor = .black
        return label
    }()
    
    let leftPriceNumLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.nanumSquareNeoBold(size: 15)
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // 스택뷰에 뷰를 추가하는 함수
//    func updateStackView() {
//        // 스택뷰에 있는 라벨 제거
//        buttonStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
//
//        // 배열에 있는 값에 따라 라벨을 추가
//        for item in items {
//
//            buttonStackView.addArrangedSubview()
//        }
//    }
    
    
}


extension PersonPricevView {
    
    func setUI() {
        
        self.addSubview(buttonStackView)
        self.addSubview(leftPriceLabel)
        self.addSubview(leftPriceNumLabel)
        self.buttonStackView.addArrangedSubview(sameButton)
        self.buttonStackView.addArrangedSubview(gameButton)
        
        setLayout()
    }
    
    func setLayout() {
        
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        leftPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        leftPriceNumLabel.translatesAutoresizingMaskIntoConstraints = false
        
        buttonStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        buttonStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        buttonStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        leftPriceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        leftPriceLabel.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: AppConstants.setupExtraConstantSize(size: 15)).isActive = true
        
        leftPriceNumLabel.topAnchor.constraint(equalTo: leftPriceLabel.topAnchor).isActive = true
        leftPriceNumLabel.bottomAnchor.constraint(equalTo: leftPriceLabel.bottomAnchor).isActive = true
        leftPriceNumLabel.leadingAnchor.constraint(equalTo: leftPriceLabel.trailingAnchor, constant: 5).isActive = true
        leftPriceNumLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor).isActive = true
    }
}
