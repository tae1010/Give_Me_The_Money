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

    let mainView = MainView()
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
        
        self.navigationController?.isNavigationBarHidden = true
        
        
        // tap mainButton
        mainAddButton.rx.tap.bind(onNext: {
            
            let chooseMenuVC = ChooseMenuViewController(chooseMenuViewModel: ChooseMenuViewModel())
            
            let navigationController = UINavigationController(rootViewController: chooseMenuVC)

            // 화면 전환 커스텀, 필자는 PullScreen으로 띄우고, VC2에서 navigationBar가 보이지 않게 설정
            navigationController.modalPresentationStyle = .fullScreen
            navigationController.isNavigationBarHidden = true
            
            self.present(navigationController, animated: true)
            
        }).disposed(by: disposeBag)
        
        

        
    }
    
}

// MARK: configure MainView
extension MainViewController {
    
    func setUI() {
        configureUI()
        
        
        view.addSubview(Scroller)
        view.addSubview(logoView)
        view.addSubview(statusView)
        view.addSubview(mainView)
        view.addSubview(mainAddButton)
        view.addSubview(usageLabelView)
        setLayout()
    }
    
    func setLayout() {
        
        logoView.translatesAutoresizingMaskIntoConstraints = false
        statusView.translatesAutoresizingMaskIntoConstraints = false
        mainView.translatesAutoresizingMaskIntoConstraints = false
        usageLabelView.translatesAutoresizingMaskIntoConstraints = false
        
        
        logoView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: AppConstants.setupNormalConstantSize(size: 20)).isActive = true
        logoView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: AppConstants.setupNormalConstantSize(size: 30)).isActive = true
        
        // 임시
        logoView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        logoView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        statusView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        statusView.topAnchor.constraint(equalTo: self.logoView.bottomAnchor, constant: AppConstants.setupNormalConstantSize(size: 50)).isActive = true
        statusView.widthAnchor.constraint(equalToConstant: AppConstants.ScreenWidth * 0.85).isActive = true
        
        
        mainAddButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: AppConstants.setupNormalConstantSize(size: -30)).isActive = true
        mainAddButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: AppConstants.setupNormalConstantSize(size: -30)).isActive = true
        
        
        mainView.topAnchor.constraint(equalTo: self.statusView.bottomAnchor, constant: AppConstants.setupNormalConstantSize(size: 40)).isActive = true
        mainView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        mainView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        mainView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true

             
    }
    
    func configureUI() {
        self.view.backgroundColor = .primaryColor
        
        mainView.layer.cornerRadius = 30
        mainView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
            
        

    }
    

}


