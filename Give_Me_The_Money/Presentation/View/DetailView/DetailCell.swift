//
//  DetailCell.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2/28/24.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

// cell안에 버튼 클릭을 알리는 protocol
protocol CustomCellDelegate: AnyObject {
    func didTapButton(in cell: DetailCell)
}

class DetailCell: UICollectionViewCell {
    
    let usageLabel: UILabel = {
        let label = UILabel()
        label.text = "detail Title"
        label.textColor = .black
        label.font = UIFont.nanumSquareNeoBold(size: 16)
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
        label.font = UIFont.nanumSquareNeo(size: 13)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()
    
    let fixButton: UIButton = {
        let button = UIButton()
        button.setTitle("수정하기", for: .normal)
        button.titleLabel?.font = UIFont.nanumSquareNeoBold(size: 15)
        button.setTitleColor(.white, for: .normal)
        
        button.backgroundColor = .primaryColor
        button.layer.cornerRadius = 8
        
        return button
    }()
    
    let foldImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "unfold")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var cellStatus = false // cell이 선택되면 true로 변경
    var delegate: CustomCellDelegate?
    let disposeBag = DisposeBag()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // cell 모양
        contentView.layer.cornerRadius = 10
        layer.masksToBounds = false
        layer.shadowOpacity = 0.15
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowRadius = 10
        
        setUI()
        
        self.contentView.backgroundColor = .white
           
        fixButton.rx.tap.bind(onNext: {
            print("템")
            self.delegate?.didTapButton(in: self)
        }).disposed(by: disposeBag)
        
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
        contentView.addSubview(foldImage)
        setLayout()
    }
    
    func setLayout() {
        usageLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        fixButton.translatesAutoresizingMaskIntoConstraints = false
        foldImage.translatesAutoresizingMaskIntoConstraints = false

        // 기본일때 cell layout
//        userLabel.isHidden = true
//        dateLabel.isHidden = true
//        fixButton.isHidden = true
//        
//        usageLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
//        usageLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20).isActive = true
//        
//        priceLabel.leadingAnchor.constraint(equalTo: usageLabel.trailingAnchor, constant: 20).isActive = true
//        priceLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
//        
//        foldImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
//        foldImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20).isActive = true
//        foldImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
//        foldImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        // 펼쳐질떄 cell layout
        userLabel.isHidden = false
        dateLabel.isHidden = false
        fixButton.isHidden = false
        
        usageLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20).isActive = true
        usageLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20).isActive = true
        
        foldImage.centerYAnchor.constraint(equalTo: self.usageLabel.centerYAnchor).isActive = true
        foldImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20).isActive = true
        foldImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
        foldImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        priceLabel.topAnchor.constraint(equalTo: self.usageLabel.bottomAnchor, constant: 30).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: self.usageLabel.leadingAnchor).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: self.foldImage.trailingAnchor).isActive = true
        
        userLabel.topAnchor.constraint(equalTo: self.priceLabel.bottomAnchor, constant: 30).isActive = true
        userLabel.leadingAnchor.constraint(equalTo: self.usageLabel.leadingAnchor).isActive = true
        userLabel.trailingAnchor.constraint(equalTo: self.foldImage.trailingAnchor).isActive = true
        
        dateLabel.topAnchor.constraint(equalTo: self.userLabel.bottomAnchor, constant: 30).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: self.usageLabel.leadingAnchor).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: self.foldImage.trailingAnchor).isActive = true
        
        fixButton.topAnchor.constraint(greaterThanOrEqualTo: self.dateLabel.bottomAnchor, constant: 30).isActive = true
        fixButton.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        fixButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        fixButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20).isActive = true
        fixButton.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20).isActive = true
    }
    
}

