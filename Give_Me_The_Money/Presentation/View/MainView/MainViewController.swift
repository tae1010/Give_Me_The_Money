//
//  ViewController.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/03/12.
//

import UIKit
import RxCocoa
import RxSwift

protocol MainViewControllerDelegate: AnyObject {
    func pushToSetTitleViewController()
    func pushToSettingViewController()
    func pushToDetailViewController()
}

class MainViewController: UIViewController, UIScrollViewDelegate {
    
    let asd: SQLiteCalculateRepository = SQLiteCalculateRepository()
    
    let Scroller: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = UIColor.white
        return scroll
    }()
    
    let logoView: UIImageView = {
        let logoView = UIImageView()
        logoView.image = UIImage(named: "logo")
        return logoView
    }()
    
    let settingView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "setting")
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "circle")
        return imageView
    }()
    
    let addButton = UsageLabelView(text: "Add", backGroundColor: UIColor.lightPrimaryColor, labelColor: .black, necessaryWidth: true)
    
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

//    let mainView = MainView()
    let usageLabelView = UsageLabelView()
    let mainAddButton = CircleAddButton()
    
    let viewModel: GroupViewModel
    
    let disposeBag = DisposeBag()
    
    weak var delegate: MainViewControllerDelegate?
    
    init(viewModel: GroupViewModel) {
        self.viewModel = viewModel
//        self.asd = SQLiteCalculateRepository()
        super.init(nibName: nil, bundle: nil)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        tabUI()
        
        asd.insert(Calculate(id: 0, mainCalculateId: 0, usage: "2", price: 1, user: Users(name: "1"), userPrice: 1, remainPrice: 1, date: Date()))
        asd.insert(Calculate(id: 0, mainCalculateId: 0, usage: "2", price: 1, user: Users(name: "1"), userPrice: 1, remainPrice: 1, date: Date()))
        asd.insert(Calculate(id: 0, mainCalculateId: 0, usage: "2", price: 1, user: Users(name: "1"), userPrice: 1, remainPrice: 1, date: Date()))
        
        if let data = asd.read() {
            for calculate in data {
                print(calculate)
            }
        }
        
//        asd.delete(by: "1")
        
        self.navigationController?.isNavigationBarHidden = true
        
        
        let tapAddButtonGesture = UITapGestureRecognizer()
        addButton.addGestureRecognizer(tapAddButtonGesture)
        
        let tapSettingViewGesture = UITapGestureRecognizer()
        settingView.addGestureRecognizer(tapSettingViewGesture)

        tapAddButtonGesture.rx.event.bind(onNext: { recognizer in
            self.delegate?.pushToSetTitleViewController()
        }).disposed(by: disposeBag)
        
        tapSettingViewGesture.rx.event.bind(onNext: { recognizer in
            self.delegate?.pushToSettingViewController()
        }).disposed(by: disposeBag)
        
        mainCollectionView.rx.setDelegate(self)
            .disposed(by: disposeBag)
        
        
        // bind mainCollectionView
        viewModel.choosePeople
            .bind(to: mainCollectionView.rx.items(cellIdentifier: "MainCell", cellType: MainCell.self)) { index, item, cell in
                cell.titleLabel.text = "일본 여행"
                cell.totalPrice.text = "$ 1,020,000"
            }
            .disposed(by: disposeBag)
        
        Observable.zip(mainCollectionView.rx.modelSelected(String.self), mainCollectionView.rx.itemSelected)
            .subscribe(onNext: { [weak self] (item, indexPath) in
                guard let self = self else { return }
                print(indexPath)
                delegate?.pushToDetailViewController()
                
            }, onError: { _ in
                print("에러")
            }).disposed(by: disposeBag)
        
//        // tap mainButton
//        mainAddButton.rx.tap.bind(onNext: {
//            let chooseMenuVC = ChooseMenuViewController(chooseMenuViewModel: ChooseMenuViewModel())
//            let navigationController = UINavigationController(rootViewController: chooseMenuVC)
//
//            navigationController.modalPresentationStyle = .fullScreen
//            navigationController.isNavigationBarHidden = true
//
//            self.present(navigationController, animated: true)
//        }).disposed(by: disposeBag)
        
    }
    
}

// MARK: configure MainView
extension MainViewController {
    
    func setUI() {
        configureUI()
        view.addSubview(Scroller)
        view.addSubview(logoView)
        view.addSubview(addButton)
        view.addSubview(settingView)
        view.addSubview(mainCollectionView)
        view.addSubview(usageLabelView)
        
        setLayout()
    }
    
    func setLayout() {
        logoView.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        settingView.translatesAutoresizingMaskIntoConstraints = false
        mainCollectionView.translatesAutoresizingMaskIntoConstraints = false
        usageLabelView.translatesAutoresizingMaskIntoConstraints = false
        
        logoView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        logoView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        logoView.widthAnchor.constraint(equalToConstant: 27).isActive = true
        logoView.heightAnchor.constraint(equalToConstant: 27).isActive = true
        
        addButton.centerYAnchor.constraint(equalTo: logoView.centerYAnchor).isActive = true
        addButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        
        settingView.centerYAnchor.constraint(equalTo: logoView.centerYAnchor).isActive = true
        settingView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: AppConstants.setupNormalConstantSize(size: 20)).isActive = true
        settingView.widthAnchor.constraint(equalToConstant: 27).isActive = true
        settingView.heightAnchor.constraint(equalToConstant: 27).isActive = true
        
//        mainAddButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: AppConstants.setupNormalConstantSize(size: -30)).isActive = true
//        mainAddButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: AppConstants.setupNormalConstantSize(size: -30)).isActive = true
        
        mainCollectionView.topAnchor.constraint(equalTo: self.settingView.bottomAnchor, constant: AppConstants.setupNormalConstantSize(size: 8)).isActive = true
        mainCollectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        mainCollectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        mainCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true

             
    }
    
    func configureUI() {
        self.view.backgroundColor = UIColor.white
    }
    
    func tabUI() {
        let tabLabel = UITapGestureRecognizer(target: self, action: #selector(didTapPushButton))
        self.addButton.addGestureRecognizer(tabLabel)
    }
    
    @objc func didTapPushButton() {
//        delegate?.pushToSetTitleViewController()
    }
    

}

extension MainViewController: UICollectionViewDelegateFlowLayout {
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
