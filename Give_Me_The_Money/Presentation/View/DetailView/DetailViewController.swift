//
//  DetailViewController.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2/28/24.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

protocol DetailViewControllerDelegate {
    func popViewController()
    func pushToMakeGroupViewController()
}

class DetailViewController: UIViewController, UIScrollViewDelegate {
    
    let backButton = BackButton()
    
    let circleAddButton = CircleAddButton()
    
    let detailTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "title"
        label.textColor = .black
        label.font = UIFont.nanumSquareNeoHeavy(size: 25)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()
    
    let detailCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        layout.minimumLineSpacing = 18
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .backGroundGrayColor
        collectionView.register(DetailCell.self, forCellWithReuseIdentifier: "DetailCell")
        return collectionView
    }()
    
    var test = BehaviorRelay<[String]>(value: ["asd", "asd","ss"])
    var delegate: DetailViewControllerDelegate?
    
    let disposeBag = DisposeBag()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .backGroundGrayColor
        setUI()
        
        detailCollectionView.rx.setDelegate(self)
            .disposed(by: disposeBag)
        
        backButton.rx.tap.bind(onNext: {
            self.delegate?.popViewController()
        }).disposed(by: disposeBag)
        
        // bind mainCollectionView
        test
            .bind(to: detailCollectionView.rx.items(cellIdentifier: "DetailCell", cellType: DetailCell.self)) { index, item, cell in
                cell.delegate = self // cell 버튼 클릭 delegate
                cell.priceLabel.text = "00,000,000 원"
            }.disposed(by: disposeBag)
        
        Observable.zip(detailCollectionView.rx.modelSelected(String.self), detailCollectionView.rx.itemSelected)
            .subscribe(onNext: { [weak self] (item, indexPath) in
                guard let self = self else { return }
                print(indexPath)
                
            }, onError: { _ in
                print("에러")
            }).disposed(by: disposeBag)
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
        
        detailCollectionView.topAnchor.constraint(equalTo: detailTitleLabel.bottomAnchor, constant: 20).isActive = true
        detailCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        detailCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        detailCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        guard let cell = detailCollectionView.dequeueReusableCell(withReuseIdentifier: "DetailCell", for: indexPath) as? DetailCell else {
            return .zero
        }
        cell.usageLabel.text = "dummy"
        cell.priceLabel.text = "dummy"
        cell.userLabel.text = "dummy"
        cell.dateLabel.text = "dummy"
        
//        let height = cell.usageLabel.frame.height + cell.priceLabel.frame.height
        let height = cell.usageLabel.frame.height + cell.priceLabel.frame.height + cell.userLabel.frame.height + cell.dateLabel.frame.height + cell.fixButton.frame.height
        
        print(cell.usageLabel.frame.height, cell.priceLabel.frame.height, cell.userLabel.frame.height, cell.dateLabel.frame.height, cell.fixButton.frame.height)

        print(height)
        return CGSize(width: collectionView.frame.width, height: height + 220)
    }
}

// MARK: DetailCell 버튼 클릭
extension DetailViewController: CustomCellDelegate {
    func didTapButton(in cell: DetailCell) {
        self.delegate?.pushToMakeGroupViewController()
    }
}
