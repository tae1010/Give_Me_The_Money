//
//  ViewController.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/03/12.
//

import UIKit
import MaterialComponents.MaterialBottomSheet
import RxCocoa
import RxSwift

class MainViewController: UIViewController, UIScrollViewDelegate {
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "circle")
        return imageView
    }()

    let gameCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10 // cell사이의 간격 설정
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(GameCell.self, forCellWithReuseIdentifier: "GameCell")
        return collectionView
    }()
    
//    let groupCollectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        layout.minimumInteritemSpacing = 0
//        layout.minimumLineSpacing = 0
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.backgroundColor = .white
//        collectionView.register(GroupCell.self, forCellWithReuseIdentifier: "GroupCell")
//        return collectionView
//    }()
    
    
    let mainAddButton = MainAddButton()
    let viewModel: MainViewModel
    
    let disposeBag = DisposeBag()
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
        gameCollectionView.rx.setDelegate(self)
            .disposed(by: disposeBag)
        
        mainAddButton.rx.tap.bind(onNext: {
            
            let chooseMenuVC = ChooseMenuViewController(chooseMenuViewModel: ChooseMenuViewModel())
            chooseMenuVC.modalPresentationStyle = .fullScreen
            
            self.present(chooseMenuVC, animated: true)
            
        }).disposed(by: disposeBag)
        
        
        viewModel.items
            .bind(to: gameCollectionView.rx.items(cellIdentifier: "GameCell", cellType: GameCell.self)) { index, item, cell in
            
                cell.usageLabel.text = "sss"
                cell.backgroundColor = .gray
            }
            .disposed(by: disposeBag)
        
//        gameCollectionView.rx.modelSelected(Item.self)
//            .subscribe(onNext: { item in
//                print("Selected item: \(item.title)")
//            })
//            .disposed(by: disposeBag)
        
        
    }
    
}

// MARK: configure MainView
extension MainViewController {
    
    func setUI() {
        view.addSubview(gameCollectionView)
//        view.addSubview(groupCollectionView)
        view.addSubview(mainAddButton)
        setLayout()
    }
    
    func setLayout() {
        
        
        
        
        mainAddButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: AppConstants.setupConstantSize(size: -30)).isActive = true
        mainAddButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: AppConstants.setupConstantSize(size: -30)).isActive = true
        
        gameCollectionView.translatesAutoresizingMaskIntoConstraints = false
        gameCollectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        gameCollectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        gameCollectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        gameCollectionView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.2
        ).isActive = true
        
    

//
//        groupCollectionView.translatesAutoresizingMaskIntoConstraints = false
//        groupCollectionView.topAnchor.constraint(equalTo: gameCollectionView.bottomAnchor, constant: 0).isActive = true
//        groupCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
//        groupCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
//        groupCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
//        
    }
    

}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == gameCollectionView{
            return CGSize(width: UIScreen.main.bounds.width / 3, height: collectionView.frame.height)
        }
        else { return CGSize(width: 0, height: 0)}
    }
}
