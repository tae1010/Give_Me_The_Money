//
//  DetailCell.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2/28/24.
//

import Foundation
import UIKit

class DetailCell: UICollectionViewCell {
    
    let usageLabel: UILabel = {
        let label = UILabel()
        label.text = "detail Title"
        label.textColor = .black
        label.font = UIFont.nanumSquareNeoExtrabold(size: 27)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()
        
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "00,000,000 원"
        label.textColor = .black
        label.font = UIFont.nanumSquareNeoHeavy(size: 18)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()
    
    let userLabel: UILabel = {
        let label = UILabel()
        label.text = "000외 0명"
        label.textColor = .black
        label.font = UIFont.nanumSquareNeoHeavy(size: 18)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "00년 0월 0일 에 작성됨"
        label.textColor = .black
        label.font = UIFont.nanumSquareNeoHeavy(size: 16)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()
    
    let fixButton: UIButton = {
        let button = UIButton()
        button.setTitle("수정하기", for: .normal)
        button.titleLabel?.font = UIFont.nanumSquareNeoBold(size: 22)
        button.setTitleColor(.white, for: .normal)
        
        button.backgroundColor = .primaryColor
        button.layer.cornerRadius = 8
        
        return button
    }()
    
    var cellStatus = false // cell이 선택되면 true로 변경
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.backgroundColor = .white
           

        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailCell {
    func setUI() {
        contentView.addSubview(usageLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(userLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(fixButton)

        setLayout()
    }
    
    func setLayout() {
        usageLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        fixButton.translatesAutoresizingMaskIntoConstraints = false
        
        if cellStatus {
            
        }
             
    }
    
}

