//
//  ChoosePeopleView.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/04/16.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class ChoosePeopleView: UIView, UIScrollViewDelegate {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "이용자"
        label.font = UIFont.nanumSquareNeoBold(size: 17)
        label.textColor = .gray
        return label
    }()
    
    let setAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("모두 선택", for: .normal)
        button.titleLabel?.font = UIFont.nanumSquareNeoBold(size: 13)
        button.setTitleColor(.lightGray, for: .normal)
        
        return button
    }()
    
    let settingButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "setting"), for: .normal)
        return button
    }()
    
    let peopleCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = AppConstants.setupWidthConstantSize(size: 10) // cell 가로간격
        layout.minimumLineSpacing = AppConstants.setupWidthConstantSize(size: 10) // cell 세로간격
        
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(PeopleCell.self, forCellWithReuseIdentifier: "PeopleCell")
        return collectionView
    }()
    
    let viewModel = MainViewModel() // 임시
    let disposeBag = DisposeBag()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        
        
        peopleCollectionView.rx.setDelegate(self)
            .disposed(by: disposeBag)
        
        
        // bind mainCollectionView
        viewModel.items
            .bind(to: peopleCollectionView.rx.items(cellIdentifier: "PeopleCell", cellType: PeopleCell.self)) { index, item, cell in
                cell.configure(text: item)
            }.disposed(by: disposeBag)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension ChoosePeopleView {
    
    func setUI() {
        
        self.addSubview(titleLabel)
        self.addSubview(setAllButton)
        self.addSubview(settingButton)
        self.addSubview(peopleCollectionView)
        
        setLayout()
    }
    
    func setLayout() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        setAllButton.translatesAutoresizingMaskIntoConstraints = false
        settingButton.translatesAutoresizingMaskIntoConstraints = false
        peopleCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        
        settingButton.topAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true
//        settingButton.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        settingButton.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        setAllButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: AppConstants.setupNormalConstantSize(size: 15)).isActive = true
        setAllButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        
        peopleCollectionView.topAnchor.constraint(equalTo: setAllButton.bottomAnchor, constant: AppConstants.setupNormalConstantSize(size: 10)).isActive = true
        peopleCollectionView.leadingAnchor.constraint(equalTo: setAllButton.leadingAnchor).isActive = true
        peopleCollectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        peopleCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 15).isActive = true
        peopleCollectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
}

//extension ChoosePeopleView: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        
//        return CGSize(width: AppConstants.ScreenWidth / 5, height: collectionView.frame.height / AppConstants.setupExtraMultiplierSize(size: 7))
//    }
//}
