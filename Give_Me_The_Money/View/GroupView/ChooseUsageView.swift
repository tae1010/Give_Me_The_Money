//
//  ChooseUsageView.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/04/09.
//

import Foundation
import UIKit


class ChooseUsageView: UIView {
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "용도"
        label.font = UIFont.nanumSquareNeoBold(size: 17)
        label.textColor = .gray
        return label
    }()
    
    let mealHStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        stackView.spacing = AppConstants.setupWidthConstantSize(size: 10)

        return stackView
    }()
    
    let alcoholHStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        stackView.spacing = AppConstants.setupWidthConstantSize(size: 10)

        return stackView
    }()
    
    let travelHStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        stackView.spacing = AppConstants.setupWidthConstantSize(size: 10)

        return stackView
    }()
    
    let usageVStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalCentering
        stackView.spacing = AppConstants.setupWidthConstantSize(size: 20)

        return stackView
    }()
    
    let roomChargeUsageView = UsageLabelView(text: "숙박비", backGroundColor: UIColor.noSelectColor, labelColor: .gray)
    let transportationCostUsageView = UsageLabelView(text: "교통비", backGroundColor: UIColor.noSelectColor, labelColor: .gray)
    
    let morningUsageView = UsageLabelView(text: "아침", backGroundColor: UIColor.noSelectColor, labelColor: .gray)
    let lunchUsageView = UsageLabelView(text: "점심", backGroundColor: UIColor.noSelectColor, labelColor: .gray)
    let dinnerUsageView = UsageLabelView(text: "저녁", backGroundColor: UIColor.noSelectColor, labelColor: .gray)
    let mealUsageView = UsageLabelView(text: "식사", backGroundColor: UIColor.noSelectColor, labelColor: .gray)
    
    let alcohol1 = UsageLabelView(text: "술 1차", backGroundColor: UIColor.noSelectColor, labelColor: .gray)
    let alcohol2 = UsageLabelView(text: "술 2차", backGroundColor: UIColor.noSelectColor, labelColor: .gray)
    let alcohol3 = UsageLabelView(text: "술 3차", backGroundColor: UIColor.noSelectColor, labelColor: .gray)
    let alcohol4 = UsageLabelView(text: "술 4차", backGroundColor: UIColor.noSelectColor, labelColor: .gray)

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        
        
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension ChooseUsageView {
    
    func setUI() {
        self.addSubview(titleLabel)
        self.addSubview(morningUsageView)
        self.addSubview(usageVStackView)
        
        
        [morningUsageView, lunchUsageView, dinnerUsageView, mealUsageView].forEach({
            self.mealHStackView.addArrangedSubview($0)
        })
        
        [alcohol1, alcohol2, alcohol3, alcohol4].forEach({
            self.alcoholHStackView.addArrangedSubview($0)
        })
        
        [roomChargeUsageView, transportationCostUsageView].forEach({
            self.travelHStackView.addArrangedSubview($0)
        })
        
        [travelHStackView, mealHStackView, alcoholHStackView].forEach({
            self.usageVStackView.addArrangedSubview($0)
        })
        
        
        setLayout()
        
    }
    
    func setLayout() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        usageVStackView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        
        usageVStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        usageVStackView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: AppConstants.setupExtraConstantSize(size: 20)).isActive = true
        usageVStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
}
