//
//  MainStatusView.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/04/03.
//

import Foundation
import UIKit


class MainStatusView: UIView {
    
    let chartView = ChartView(circleSize: AppConstants.ScreenWidth / 8)
    
    let statusTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.nanumSquareNeoExtrabold(size: 17)
        label.numberOfLines = 1
        label.text = "현황"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let totalPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.nanumSquareNeoBold(size: 13)
        label.numberOfLines = 1
        label.text = "총: 00,000,000원"
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let myGroupPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.nanumSquareNeoBold(size: 13)
        label.numberOfLines = 1
        label.text = "모임: 00,000원"
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let myGamePrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.nanumSquareNeoBold(size: 13)
        label.numberOfLines = 1
        label.text = "게임: 00,000원"
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceStatusStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillEqually

        return stackView
    }()
    
    var price: [Double] = [1,2,3]
    var usage: [String] = ["a","b","c"]
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        self.layer.cornerRadius = AppConstants.setupNormalConstantSize(size: 30)
        
//        self.layer.shadowColor = UIColor.black.cgColor // 색깔
//        self.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
//        self.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
//        self.layer.shadowRadius = 5 // 반경
//        self.layer.shadowOpacity = 0.3 // alpha값
        
        chartView.backgroundColor = .clear
        setupUI()
        
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension MainStatusView {
    
    
    
    func setupUI() {
        
        
        [totalPriceLabel, myGroupPrice, myGamePrice].map {
            self.priceStatusStackView.addArrangedSubview($0)
        }
        
        addSubview(chartView)
        addSubview(statusTitleLabel)
        addSubview(priceStatusStackView)

        
        setLayOut()
        
    }
    
    func setLayOut() {
        
        chartView.translatesAutoresizingMaskIntoConstraints = false
        statusTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceStatusStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        chartView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: AppConstants.setupWidthConstantSize(size: 50)).isActive = true
        chartView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        chartView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3).isActive = true
        chartView.heightAnchor.constraint(equalTo: chartView.widthAnchor).isActive = true
        
        
        statusTitleLabel.topAnchor.constraint(equalTo: chartView.topAnchor).isActive = true
        statusTitleLabel.leadingAnchor.constraint(equalTo: chartView.trailingAnchor, constant: AppConstants.setupWidthConstantSize(size: 30)).isActive = true
        statusTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        
        
        priceStatusStackView.topAnchor.constraint(equalTo: statusTitleLabel.bottomAnchor, constant: 10).isActive = true
        priceStatusStackView.bottomAnchor.constraint(equalTo: chartView.bottomAnchor).isActive = true
        priceStatusStackView.leadingAnchor.constraint(equalTo: statusTitleLabel.leadingAnchor).isActive = true
        priceStatusStackView.trailingAnchor.constraint(equalTo: statusTitleLabel.trailingAnchor).isActive = true
        
        
        
        
        self.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        
        
        
    }
    
    
}
