//
//  SetTitleView.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/05/06.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

enum titleType {
    case game
    case group
}

class SetTitleVeiwController: UIViewController {
    
    let closeButton = CloseButton()
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.nanumSquareNeoBold(size: 20)
        label.text = "이름을 정헤주세요"
        return label
    }()
    
    let titleTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.nanumSquareNeoHeavy(size: 15)
        textField.textColor = .black
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let makeButton = CustomMakeButton(title: "만들기", isEnabled: true)
    
    var type: titleType?
    
    init(titleType: titleType) {
        super.init(nibName: nil, bundle: nil)
        self.type = titleType
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        checkMenuType(titleType: type ?? .game)
        setUI()
    }
    
    func checkMenuType(titleType: titleType) {
        titleLabel.text = titleType == .game ? "게임 이름을 정해주세요" : "모임 이름을 정해주세요"
    }
}

extension SetTitleVeiwController {
    func setUI() {
        self.view.addSubview(closeButton)
        self.view.addSubview(titleLabel)
        self.view.addSubview(titleTextField)
        self.view.addSubview(makeButton)
        
        setLayout()
    }
    
    func setLayout() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        makeButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.heightAnchor.constraint(equalToConstant: AppConstants.ScreenHeight).isActive = true
        
        closeButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: AppConstants.setupExtraConstantSize(size: 20)).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: AppConstants.setupWidthConstantSize(size: 20)).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: AppConstants.setupExtraConstantSize(size: 20)).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: closeButton.leadingAnchor).isActive = true
        
        titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: AppConstants.setupExtraConstantSize(size: 20)).isActive = true
        titleTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        titleTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        makeButton.topAnchor.constraint(greaterThanOrEqualTo: titleTextField.bottomAnchor, constant: AppConstants.setupExtraConstantSize(size: 20)).isActive = true
        makeButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        makeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        makeButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
}
