//
//  SetTitleView.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/05/06.
//

import Foundation
import UIKit

class SetTitleViewController: UIViewController {
    
    let darkView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.alpha = 0.0
        return view
    }()
    
    let setTitleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.clipsToBounds = true
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.nanumSquareNeoBold(size: 20)
        label.text = "이름을 정헤주세요"
        return label
    }()
    
    let closeButton = CloseButton()
    let titleTextField = CustomTextField()
    let makeButton = CustomMakeButton(title: "만들기", isEnabled: true)
    
    var type: SideButtonMode?
    
    init(titleType: SideButtonMode) {
        super.init(nibName: nil, bundle: nil)
        self.type = titleType
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        setKeyboardObserver()
        checkMenuType(sideButtonMode: type ?? .game)
        setUI()
        tapUI()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        showBottomSheet()
    }
    
    func checkMenuType(sideButtonMode: SideButtonMode) {
        titleLabel.text = sideButtonMode == .game ? "게임 이름을 정해주세요" : "모임 이름을 정해주세요"
    }
    
    func showBottomSheet() {
        
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseIn, animations: {
            // 4 - 1
            self.darkView.backgroundColor = .gray
            self.darkView.alpha = 0.7
            // 4 - 2
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

}

extension SetTitleViewController {
    func setUI() {
        self.view.addSubview(darkView)
        self.view.addSubview(setTitleView)
        self.setTitleView.addSubview(closeButton)
        self.setTitleView.addSubview(titleLabel)
        self.setTitleView.addSubview(titleTextField)
        self.setTitleView.addSubview(makeButton)
        
        setLayout()
    }
    
    func setLayout() {
        darkView.translatesAutoresizingMaskIntoConstraints = false
        setTitleView.translatesAutoresizingMaskIntoConstraints = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        makeButton.translatesAutoresizingMaskIntoConstraints = false
        
        darkView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        darkView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        darkView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        darkView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        setTitleView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: AppConstants.ScreenHeight / 1.8).isActive = true
        setTitleView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        setTitleView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        setTitleView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        closeButton.topAnchor.constraint(equalTo: setTitleView.topAnchor, constant: AppConstants.setupExtraConstantSize(size: 20)).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: setTitleView.leadingAnchor, constant: AppConstants.setupWidthConstantSize(size: 20)).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: AppConstants.setupExtraConstantSize(size: 20)).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: closeButton.leadingAnchor).isActive = true
        
        titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: AppConstants.setupExtraConstantSize(size: 40)).isActive = true
        titleTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        titleTextField.centerXAnchor.constraint(equalTo: setTitleView.centerXAnchor).isActive = true
        
        makeButton.topAnchor.constraint(greaterThanOrEqualTo: titleTextField.bottomAnchor, constant: AppConstants.setupExtraConstantSize(size: 50)).isActive = true
        makeButton.leadingAnchor.constraint(equalTo: setTitleView.leadingAnchor).isActive = true
        makeButton.trailingAnchor.constraint(equalTo: setTitleView.trailingAnchor).isActive = true
        makeButton.bottomAnchor.constraint(equalTo: setTitleView.bottomAnchor).isActive = true
    }
    
    func tapUI() {
        closeButton.clickAction = {
            self.darkView.alpha = 0.0
            self.dismiss(animated: true)
        }
        
        makeButton.clickAction = {
            self.darkView.alpha = 0.0
//            let makeGroupViewController = MakeGroupViewController()
//            makeGroupViewController.modalPresentationStyle = .fullScreen
//            self.navigationController?.pushViewController(makeGroupViewController, animated: true)
            
            guard let pvc = self.presentingViewController else { return }
            
            let makeGroupViewController = MakeGroupViewController()
            let navigationController = UINavigationController(rootViewController: makeGroupViewController)

            navigationController.modalPresentationStyle = .fullScreen
            navigationController.isNavigationBarHidden = true

            // 기존팝업창은 지우고 reallyCheckPopup창을 띄움
            self.dismiss(animated: true) {
                pvc.present(navigationController, animated: true)
            }

            
            
        }
    }
}
