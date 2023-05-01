//
//  ChooseUsageView.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/04/09.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift


class ChooseUsageView: UIView {
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "용도"
        label.font = UIFont.nanumSquareNeoBold(size: 17)
        label.textColor = .gray
        return label
    }()
    
    let textField = CustomNumberTextField()
    
    let mealHStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = AppConstants.setupWidthConstantSize(size: 10)

        return stackView
    }()
    
    
    let alcoholHStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = AppConstants.setupWidthConstantSize(size: 10)

        return stackView
    }()
    
    let travelHStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = AppConstants.setupWidthConstantSize(size: 10)

        return stackView
    }()
    
    let usageVStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        stackView.spacing = AppConstants.setupWidthConstantSize(size: 20)

        return stackView
    }()
    
    let roomChargeUsageView = UsageLabelView(text: "숙박비", backGroundColor: UIColor.noSelectColor, labelColor: .gray, necessaryWidth: true)
    let transportationCostUsageView = UsageLabelView(text: "교통비", backGroundColor: UIColor.noSelectColor, labelColor: .gray, necessaryWidth: true)
    
    let morningUsageView = UsageLabelView(text: "아침", backGroundColor: UIColor.noSelectColor, labelColor: .gray, necessaryWidth: true)
    let lunchUsageView = UsageLabelView(text: "점심", backGroundColor: UIColor.noSelectColor, labelColor: .gray, necessaryWidth: true)
    let dinnerUsageView = UsageLabelView(text: "저녁", backGroundColor: UIColor.noSelectColor, labelColor: .gray, necessaryWidth: true)
    let mealUsageView = UsageLabelView(text: "식사", backGroundColor: UIColor.noSelectColor, labelColor: .gray, necessaryWidth: true)
    
    let alcohol1 = UsageLabelView(text: "술 1차", backGroundColor: UIColor.noSelectColor, labelColor: .gray, necessaryWidth: true)
    let alcohol2 = UsageLabelView(text: "술 2차", backGroundColor: UIColor.noSelectColor, labelColor: .gray, necessaryWidth: true)
    let alcohol3 = UsageLabelView(text: "술 3차", backGroundColor: UIColor.noSelectColor, labelColor: .gray, necessaryWidth: true)
    let alcohol4 = UsageLabelView(text: "술 4차", backGroundColor: UIColor.noSelectColor, labelColor: .gray, necessaryWidth: true)
    

    



    
    
    let disposeBag = DisposeBag()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        tapUI()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    // stackview 안에 라벨 클릭 이벤트
    func tapUI() {
        
        let tapRoomChargeUsageView = UITapGestureRecognizer()
        let tapTransportationCostUsageView = UITapGestureRecognizer()
        let tapMorningUsageView = UITapGestureRecognizer()
        let tapLunchUsageView = UITapGestureRecognizer()
        let tapDinnerUsageView = UITapGestureRecognizer()
        let tapMealUsageView = UITapGestureRecognizer()
        let tapAlcohol1 = UITapGestureRecognizer()
        let tapAlcohol2 = UITapGestureRecognizer()
        let tapAlcohol3 = UITapGestureRecognizer()
        let tapAlcohol4 = UITapGestureRecognizer()
        
        let labels = [roomChargeUsageView, transportationCostUsageView, morningUsageView, lunchUsageView, dinnerUsageView, mealUsageView, alcohol1, alcohol2, alcohol3, alcohol4]
        
        let gestureRecognizers = [
            tapRoomChargeUsageView, tapTransportationCostUsageView, tapMorningUsageView, tapLunchUsageView, tapDinnerUsageView, tapMealUsageView, tapAlcohol1, tapAlcohol2, tapAlcohol3, tapAlcohol4]
        
        labels.forEach { label in
            gestureRecognizers.forEach { gestureRecognizer in
                label.addGestureRecognizer(gestureRecognizer)
            }
        }
        
        
        for (index, label) in labels.enumerated() {
            let tapGestureRecognizer = UITapGestureRecognizer()
            label.addGestureRecognizer(tapGestureRecognizer)
            
            tapGestureRecognizer.rx.event.bind { _ in
                // 선택된 라벨의 색상을 변경
                labels[index].backgroundColor = .primaryColor
                labels[index].usageLabel.textColor = .white
                
                // 선택되지 않은 다른 라벨들의 색상을 원래 색으로 변경
                for (otherIndex, otherLabel) in labels.enumerated() where otherIndex != index {
                    otherLabel.backgroundColor = .noSelectColor
                    otherLabel.usageLabel.textColor = .gray
                }
            }.disposed(by: disposeBag)
        }

    }
    
}

extension ChooseUsageView {
    
    func setUI() {
        self.addSubview(titleLabel)
//        self.addSubview(textField)
        self.addSubview(usageVStackView)
        
        [roomChargeUsageView, transportationCostUsageView].forEach({
            self.travelHStackView.addArrangedSubview($0)
        })
        
        [morningUsageView, lunchUsageView, dinnerUsageView, mealUsageView].forEach({
            self.mealHStackView.addArrangedSubview($0)
        })
        
        [alcohol1, alcohol2, alcohol3, alcohol4].forEach({
            self.alcoholHStackView.addArrangedSubview($0)
        })
        
        [travelHStackView, mealHStackView, alcoholHStackView].forEach({
            self.usageVStackView.addArrangedSubview($0)
        })
        
        setLayout()
        
    }
    
    func setLayout() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        textField.translatesAutoresizingMaskIntoConstraints = false
        usageVStackView.translatesAutoresizingMaskIntoConstraints = false
    
        
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        
        
//        textField.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: AppConstants.setupWidthConstantSize(size: 10)).isActive = true
//        textField.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: AppConstants.setupWidthConstantSize(size: -10)).isActive = true
//        textField.topAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true
//        textField.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -2).isActive = true
//
//        titleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        
        usageVStackView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: AppConstants.setupExtraConstantSize(size: 30)).isActive = true
        usageVStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        usageVStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        usageVStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
