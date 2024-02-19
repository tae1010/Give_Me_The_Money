//
//  UserPreSetViewController.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2024/02/14.
//

import Foundation
import UIKit
import RxSwift

protocol UserPreSetViewControllerDelegate {
    func dismissToMainViewController()
}

class UserPreSetViewController: UIViewController {
    
    let backButton = BackButton()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.nanumSquareNeoBold(size: 20)
        label.text = "인원 프리셋"
        label.textColor = .black
        return label
    }()
    
    let firstPreSetTextField = CustomTextField()
    let secondPreSetTextField = CustomTextField()
    let thirdPreSetTextField = CustomTextField()
    
    let rightImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "right")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var delegate: UserPreSetViewControllerDelegate?
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupUI()
        
        backButton.rx.tap.bind(onNext: {
            print("뒤로가기")
        }).disposed(by: disposeBag)
    }

}

extension UserPreSetViewController {
    func setupUI() {
        view.addSubview(backButton)
        view.addSubview(titleLabel)
        view.addSubview(firstPreSetTextField)
        view.addSubview(secondPreSetTextField)
        view.addSubview(thirdPreSetTextField)
        view.addSubview(rightImage)

        setLayOut()
    }
    
    func setLayOut() {
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        firstPreSetTextField.translatesAutoresizingMaskIntoConstraints = false
        secondPreSetTextField.translatesAutoresizingMaskIntoConstraints = false
        thirdPreSetTextField.translatesAutoresizingMaskIntoConstraints = false
        
        backButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: AppConstants.setupExtraConstantSize(size: 20)).isActive = true
        backButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: AppConstants.setupWidthConstantSize(size: 20)).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: backButton.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        firstPreSetTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        firstPreSetTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        
        rightImage.centerYAnchor.constraint(equalTo: firstPreSetTextField.centerYAnchor).isActive = true
        rightImage.leadingAnchor.constraint(equalTo: firstPreSetTextField.trailingAnchor, constant: 20).isActive = true
        rightImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        rightImage.widthAnchor.constraint(equalToConstant: 13).isActive = true
        rightImage.heightAnchor.constraint(equalToConstant: 13).isActive = true
        
        secondPreSetTextField.topAnchor.constraint(equalTo: firstPreSetTextField.bottomAnchor, constant: 20).isActive = true
        secondPreSetTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        secondPreSetTextField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        
        thirdPreSetTextField.topAnchor.constraint(equalTo: secondPreSetTextField.bottomAnchor, constant: 20).isActive = true
        thirdPreSetTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        thirdPreSetTextField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        
    }
}
