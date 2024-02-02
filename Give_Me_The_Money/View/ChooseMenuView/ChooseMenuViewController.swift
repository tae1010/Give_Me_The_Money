//
//  chooseMenuViewController.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/03/23.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift



class ChooseMenuViewController: UIViewController {
    
    let closeButton = CloseButton()
    let chooseMenuTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "메뉴 선택"
        label.textAlignment = .center
        label.font = UIFont.nanumSquareNeoBold(size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let gameAddButton = SideAddButton(buttonMode: .game)
    let groupAddButton = SideAddButton(buttonMode: .group)
    let makeButton = CustomMakeButton(title: "만들기", isEnabled: false)
    
    let tapGameButtonGesture = UITapGestureRecognizer() // 게임 만들기 버튼 클릭 제스쳐
    let tapGroupButtonGesture = UITapGestureRecognizer() // 그룹 만들기 버튼 클릭 제스쳐
    
    private var chooseMenuViewModel: ChooseMenuViewModel
    let disposeBag = DisposeBag()
    
    //MARK: init
    init(chooseMenuViewModel: ChooseMenuViewModel) {
        self.chooseMenuViewModel = chooseMenuViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setUI()
        tapUI()
        
        // 그룹 만들기 버튼 클릭
        tapGroupButtonGesture.rx.event.bind(onNext: { _ in
            self.chooseMenuViewModel.sideMenuStatusRelay.accept(.group)
            self.changeUI(buttonStatus: .group)
            
        }).disposed(by: disposeBag)

        
        // 게임 만들기 버튼 클릭
        tapGameButtonGesture.rx.event.bind(onNext: { _ in
            self.chooseMenuViewModel.sideMenuStatusRelay.accept(.game)
            self.changeUI(buttonStatus: .game)
            
        }).disposed(by: disposeBag)

        
        // 만들기 버튼 활성화
        chooseMenuViewModel.checkMakeButtonIsEnabled.subscribe(onNext: { [weak self] isEnabled in
            self?.makeButton.isEnabled = isEnabled
        }).disposed(by: chooseMenuViewModel.disposedBag)
        
        
        // 만들기 버튼 클릭
        makeButton.rx.tap.bind(onNext: {
            let setTitleVC = SetTitleViewController()

            setTitleVC.modalPresentationStyle = .overFullScreen
            self.present(setTitleVC, animated: true, completion: nil)

        }).disposed(by: disposeBag)
        
        
        // 닫기 버튼 클릭
        closeButton.rx.tap.bind(onNext: {
            self.dismiss(animated: true)
        }).disposed(by: disposeBag)
    }
    
    //MARK: Function
    
    // 뷰 클릭시 ui변경
    func changeUI(buttonStatus: SideButtonMode) {
        
        // 버튼 ui 변경시 만들기 버튼 ui도 변경
        self.makeButton.backgroundColor = .primaryColor
        self.makeButton.setTitleColor(.white, for: .normal)

        // 버튼 ui 변경
        self.groupAddButton.backgroundColor = buttonStatus == .group ? .lightPrimaryColor : .white
        self.groupAddButton.menuTitleLabel.textColor = buttonStatus == .group ? .primaryColor : .lightGray
        self.groupAddButton.menuDescriptionLabel.textColor = buttonStatus == .group ? .primaryColor : .lightGray
        self.groupAddButton.descriptionImageView.image = buttonStatus == .group ? UIImage(named: "groupButton") : UIImage(named: "noSelectGroupButton")
        self.groupAddButton.checkImageView.image = buttonStatus == .group ? UIImage(named: "check") : UIImage(named: "nonCheck")
        
        self.gameAddButton.backgroundColor = buttonStatus == .game ? .lightPrimaryColor : .white
        self.gameAddButton.menuTitleLabel.textColor = buttonStatus == .game ? .primaryColor : .lightGray
        self.gameAddButton.menuDescriptionLabel.textColor = buttonStatus == .game ? .primaryColor : .lightGray
        self.gameAddButton.descriptionImageView.image = buttonStatus == .game ? UIImage(named: "gameButton") : UIImage(named: "noSelectGameButton")
        self.gameAddButton.checkImageView.image = buttonStatus == .game ? UIImage(named: "check") : UIImage(named: "nonCheck")
    }

}


//MARK: UI Setting
extension ChooseMenuViewController {
    
    func setUI() {
        self.view.addSubview(closeButton)
        self.view.addSubview(gameAddButton)
        self.view.addSubview(groupAddButton)
        self.view.addSubview(chooseMenuTitleLabel)
        self.view.addSubview(makeButton)

        setLayout()
    }
    
    func setLayout() {
        
        self.closeButton.translatesAutoresizingMaskIntoConstraints = false
        self.chooseMenuTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.gameAddButton.translatesAutoresizingMaskIntoConstraints = false
        self.groupAddButton.translatesAutoresizingMaskIntoConstraints = false
        self.makeButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.closeButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: AppConstants.setupExtraConstantSize(size: 20)).isActive = true
        self.closeButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: AppConstants.setupWidthConstantSize(size: 20)).isActive = true
        
        self.chooseMenuTitleLabel.leadingAnchor.constraint(equalTo: self.closeButton.leadingAnchor).isActive = true
        self.chooseMenuTitleLabel.topAnchor.constraint(equalTo: self.closeButton.bottomAnchor, constant: AppConstants.setupNormalConstantSize(size: 24)).isActive = true
        
        self.groupAddButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.groupAddButton.topAnchor.constraint(equalTo: self.chooseMenuTitleLabel.bottomAnchor, constant: AppConstants.setupNormalConstantSize(size: 34)).isActive = true
        
        self.gameAddButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.gameAddButton.topAnchor.constraint(equalTo: self.groupAddButton.bottomAnchor, constant: AppConstants.setupNormalConstantSize(size: 20)).isActive = true
        
        self.makeButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.makeButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.makeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    func tapUI() {
        gameAddButton.isUserInteractionEnabled = true
        gameAddButton.addGestureRecognizer(tapGameButtonGesture)
        
        groupAddButton.isUserInteractionEnabled = true
        groupAddButton.addGestureRecognizer(tapGroupButtonGesture)
    }

}
