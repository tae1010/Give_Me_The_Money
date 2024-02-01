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
        layout.sectionInset = UIEdgeInsets(top: 7, left: 0, bottom: 7, right: 0)
        layout.minimumLineSpacing = 12
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .veryveryLightGrey
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
                cell.titleLabel.text = "일본 여행"
                cell.totalPrice.text = "$ 1,020,000"
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
        addSubview(mainCollectionView)
        setLayout()
    }
    
    func setLayout() {
        mainCollectionView.translatesAutoresizingMaskIntoConstraints = false

        mainCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        mainCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        mainCollectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        mainCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 15).isActive = true

    }
}



extension MainView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        guard let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: "MainCell", for: indexPath) as? MainCell else {
            return .zero
        }
        cell.titleLabel.text = "dummy"
        cell.editLabel.text = "dummy"
        cell.totalPrice.text = "dummy"
        
        let height = cell.titleLabel.frame.height + cell.editLabel.frame.height + cell.totalPrice.frame.height

        return CGSize(width: collectionView.frame.width, height: height +  110)
    }
}
