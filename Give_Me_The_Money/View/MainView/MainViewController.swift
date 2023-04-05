//
//  ViewController.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/03/12.
//

import UIKit
import RxCocoa
import RxSwift

class MainViewController: UIViewController, UIScrollViewDelegate {
    
    let Scroller: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = UIColor.white
        return scroll
    }()
    
    let logoView: UIView = {
        let logoView = UIView()
        logoView.backgroundColor = .gray
        return logoView
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "circle")
        return imageView
    }()

    let mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = AppConstants.setupConstantSize(size: 30) // cell 세로사이의 간격 설정
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(MainCell.self, forCellWithReuseIdentifier: "MainCell")
        return collectionView
    }()
    
    let usageLabelView = UsageLabelView()
    let statusView = MainStatusView()
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
        
        mainCollectionView.rx.setDelegate(self)
            .disposed(by: disposeBag)
        
        
        // tap mainButton
        mainAddButton.rx.tap.bind(onNext: {
            
            let chooseMenuVC = ChooseMenuViewController(chooseMenuViewModel: ChooseMenuViewModel())
            chooseMenuVC.modalPresentationStyle = .fullScreen
            
            self.present(chooseMenuVC, animated: true)
            
        }).disposed(by: disposeBag)
        
        
        // bind mainCollectionView
        viewModel.items
            .bind(to: mainCollectionView.rx.items(cellIdentifier: "MainCell", cellType: MainCell.self)) { index, item, cell in
            
                

            }
            .disposed(by: disposeBag)
        
    }
    
}

// MARK: configure MainView
extension MainViewController {
    
    func setUI() {
        view.addSubview(Scroller)
        view.addSubview(logoView)
        view.addSubview(statusView)
        view.addSubview(mainCollectionView)
        view.addSubview(mainAddButton)
        view.addSubview(usageLabelView)
        setLayout()
    }
    
    func setLayout() {
        
        logoView.translatesAutoresizingMaskIntoConstraints = false
        statusView.translatesAutoresizingMaskIntoConstraints = false
        mainCollectionView.translatesAutoresizingMaskIntoConstraints = false
        mainCollectionView.translatesAutoresizingMaskIntoConstraints = false
        usageLabelView.translatesAutoresizingMaskIntoConstraints = false
        
        
        logoView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: AppConstants.setupConstantSize(size: 20)).isActive = true
        logoView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: AppConstants.setupConstantSize(size: 30)).isActive = true
        logoView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        logoView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        statusView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        statusView.topAnchor.constraint(equalTo: self.logoView.bottomAnchor, constant: AppConstants.setupConstantSize(size: 30)).isActive = true
        statusView.widthAnchor.constraint(equalToConstant: AppConstants.ScreenWidth * 0.9).isActive = true
        
        
        mainAddButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: AppConstants.setupConstantSize(size: -30)).isActive = true
        mainAddButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: AppConstants.setupConstantSize(size: -30)).isActive = true
        
        
        mainCollectionView.topAnchor.constraint(equalTo: self.statusView.bottomAnchor, constant: AppConstants.setupConstantSize(size: 30)).isActive = true
        mainCollectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        mainCollectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        mainCollectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        mainCollectionView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.55).isActive = true
             
    }
    

}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == mainCollectionView{
            return CGSize(width: AppConstants.ScreenWidth * 0.9, height: collectionView.frame.height / 2.6)
        }
        else { return CGSize(width: 0, height: 0)}
    }
}
