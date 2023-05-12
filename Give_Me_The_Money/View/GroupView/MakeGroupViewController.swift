//
//  MakeGroupViewController.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/04/08.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class MakeGroupViewController: UIViewController {
    
    // 스크롤뷰
    let contentScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
        
        return scrollView
    }()
    
    // 스크롤뷰안에 contentView
    let contentView = UIView()
    
    // 뒤로가기
    let backButton = BackButton()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "모임 만들기"
        label.font = UIFont.nanumSquareNeoBold(size: 24)
        return label
    }()
    
    // 용도 view
    let chooseUsageView = ChooseUsageView()
    
    let choosePriceView = ChoosePriceView()
    
    let choosePeopleView = ChoosePeopleView()
    
    let personPriceView = PersonPricevView()
    
    let makeButton = CustomMakeButton(title: "만들기", isEnabled: true)
    let disposeBag = DisposeBag()
    
    let tapChooseUsageView = UITapGestureRecognizer() // 뒤로가기 버튼 클릭 제스쳐
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        hideKeyboardWhenTappedAround()
        setUI()
        tapUI()
        
        backButton.rx.tap.bind(onNext: {
            print("뒤로가기 클릭")
            self.dismiss(animated: true, completion: nil)
            self.navigationController?.popViewController(animated: true)
        }).disposed(by: disposeBag)
        
        
        tapChooseUsageView.rx.event.bind(onNext: {_ in
            
        }).disposed(by: disposeBag)
    }
    
}


extension MakeGroupViewController {
    
    func setUI() {
        
        view.addSubview(contentScrollView)

        contentScrollView.addSubview(contentView)
        contentView.addSubview(backButton)
        contentView.addSubview(titleLabel)
        contentView.addSubview(chooseUsageView)
        contentView.addSubview(choosePriceView)
        contentView.addSubview(choosePeopleView)
        contentView.addSubview(personPriceView)
        contentView.addSubview(makeButton)
        

        setLayout()

    }
    
    func setLayout() {
        
        contentScrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        chooseUsageView.translatesAutoresizingMaskIntoConstraints = false
        choosePriceView.translatesAutoresizingMaskIntoConstraints = false
        choosePeopleView.translatesAutoresizingMaskIntoConstraints = false
        personPriceView.translatesAutoresizingMaskIntoConstraints = false
        makeButton.translatesAutoresizingMaskIntoConstraints = false
        
        contentScrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        contentScrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        contentScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        contentScrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        contentView.topAnchor.constraint(equalTo: contentScrollView.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: contentScrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: contentScrollView.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: contentScrollView.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: contentScrollView.widthAnchor).isActive = true

        
        backButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: AppConstants.setupExtraConstantSize(size: 20)).isActive = true
        backButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: AppConstants.setupWidthConstantSize(size: 20)).isActive = true


        titleLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: AppConstants.setupExtraConstantSize(size: 20)).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: backButton.leadingAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        
        chooseUsageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: AppConstants.setupWidthConstantSize(size: 50)).isActive = true
        chooseUsageView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        chooseUsageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        
        choosePriceView.topAnchor.constraint(equalTo: chooseUsageView.bottomAnchor, constant: AppConstants.setupWidthConstantSize(size: 90)).isActive = true
        choosePriceView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        choosePriceView.centerXAnchor.constraint(equalTo: contentScrollView.centerXAnchor).isActive = true
        
        
        choosePeopleView.topAnchor.constraint(equalTo: choosePriceView.bottomAnchor, constant: AppConstants.setupWidthConstantSize(size: 90)).isActive = true
        choosePeopleView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        choosePeopleView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        
        personPriceView.topAnchor.constraint(equalTo: choosePeopleView.bottomAnchor, constant: AppConstants.setupWidthConstantSize(size: 20)).isActive = true
        personPriceView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        personPriceView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true

        
        makeButton.topAnchor.constraint(equalTo: personPriceView.bottomAnchor, constant: AppConstants.setupWidthConstantSize(size: 90)).isActive = true
        makeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        makeButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        makeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    func tapUI() {
        chooseUsageView.isUserInteractionEnabled = true
        chooseUsageView.addGestureRecognizer(tapChooseUsageView)
    }
    
    func configureUI() {
        contentView.widthAnchor.constraint(equalTo: contentScrollView.widthAnchor).isActive = true
    }
}
