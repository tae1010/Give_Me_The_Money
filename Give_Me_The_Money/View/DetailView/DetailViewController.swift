//
//  DetailViewController.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2/28/24.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    let backButton = BackButton()
    
    let circleAddButton = CircleAddButton()
    
    let detailTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "title"
        label.textColor = .black
        label.font = UIFont.nanumSquareNeoExtrabold(size: 19)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()
    
    let detailCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.minimumLineSpacing = 12
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .veryveryLightGrey
        collectionView.register(DetailCell.self, forCellWithReuseIdentifier: "DetailCell")
        return collectionView
    }()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .veryveryLightGrey
    }
}

extension DetailViewController {
    
    func setUI() {
        
        view.addSubview(backButton)
        view.addSubview(circleAddButton)
        view.addSubview(detailTitleLabel)
        view.addSubview(detailCollectionView)

        setLayout()
    }
    
    func setLayout() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        circleAddButton.translatesAutoresizingMaskIntoConstraints = false
        detailTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        detailCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        backButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: AppConstants.setupExtraConstantSize(size: 20)).isActive = true
        backButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: AppConstants.setupWidthConstantSize(size: 20)).isActive = true

        circleAddButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: AppConstants.setupNormalConstantSize(size: -30)).isActive = true
        circleAddButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: AppConstants.setupNormalConstantSize(size: -30)).isActive = true
        
        detailTitleLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 14).isActive = true
        detailTitleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        detailTitleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        
        detailCollectionView.topAnchor.constraint(equalTo: detailTitleLabel.bottomAnchor, constant: 14).isActive = true
        detailCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        detailCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        detailCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
}
