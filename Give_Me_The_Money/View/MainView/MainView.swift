//
//  MainView.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/04/07.
//

import Foundation
import UIKit
import RxSwift

class MainView: UIView, UIScrollViewDelegate {
    
    let viewModel = GroupViewModel() // 임시
    
    let allLabel = UsageLabelView(text: "전체", backGroundColor: .customRedColor, labelColor: .white, necessaryWidth: false)
    
    let groupLabel = UsageLabelView(text: "모임", backGroundColor: .customYellowColor, labelColor: .white, necessaryWidth: false)
    
    let gameLabel = UsageLabelView(text: "게임", backGroundColor: .customGreenColor, labelColor: .white, necessaryWidth: false)
    
    let mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = AppConstants.setupNormalConstantSize(size: 30) // cell 세로사이의 간격 설정
        
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(MainCell.self, forCellWithReuseIdentifier: "MainCell")
        return collectionView
    }()
    
    let statusButtonStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = AppConstants.setupWidthConstantSize(size: 30)

        return stackView
    }()
    
    let disposeBag = DisposeBag()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        setupUI()
        
        mainCollectionView.rx.setDelegate(self)
            .disposed(by: disposeBag)
        
        
        
        // bind mainCollectionView
        viewModel.choosePeople
            .bind(to: mainCollectionView.rx.items(cellIdentifier: "MainCell", cellType: MainCell.self)) { index, item, cell in

            }
            .disposed(by: disposeBag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

//MARK: UI
extension MainView {
    
    func setupUI() {
        
        [allLabel, groupLabel, gameLabel].forEach({
            self.statusButtonStackView.addArrangedSubview($0)
        })
        
        addSubview(mainCollectionView)
//        addSubview(statusButtonStackView)
        setLayout()
        
    }
    
    func setLayout() {
//        statusButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        mainCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
//        statusButtonStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        statusButtonStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: AppConstants.setupWidthConstantSize(size: 40)).isActive = true
//        statusButtonStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: AppConstants.setupNormalConstantSize(size: 40)).isActive = true
        
        mainCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        mainCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        mainCollectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: AppConstants.setupExtraConstantSize(size: 40)).isActive = true
        mainCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 15).isActive = true

    }
}


 
extension MainView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        return CGSize(width: AppConstants.ScreenWidth * 0.85, height: collectionView.frame.height / AppConstants.setupExtraMultiplierSize(size: 4))
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height / AppConstants.setupExtraMultiplierSize(size: 4))
    }
}
