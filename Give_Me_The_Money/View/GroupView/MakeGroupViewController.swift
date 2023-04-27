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
//        scrollView.showsVerticalScrollIndicator = false
        
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

    let disposeBag = DisposeBag()
    
    let tapChooseUsageView = UITapGestureRecognizer() // 뒤로가기 버튼 클릭 제스쳐
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setUI()
        tapUI()
        
        backButton.rx.tap.bind(onNext: {
            print("뒤로가기 클릭")
            self.navigationController?.popViewController(animated: true)
        }).disposed(by: disposeBag)
        
        
        tapChooseUsageView.rx.event.bind(onNext: {
            print($0)
        }).disposed(by: disposeBag)
    }
}


extension MakeGroupViewController {
    
    func setUI() {
        
        view.addSubview(contentScrollView)
        contentScrollView.addSubview(backButton)
        contentScrollView.addSubview(titleLabel)
        contentScrollView.addSubview(chooseUsageView)
        contentScrollView.addSubview(choosePriceView)
        contentScrollView.addSubview(choosePeopleView)
        
        contentScrollView.isUserInteractionEnabled = true
        backButton.isUserInteractionEnabled = true
        titleLabel.isUserInteractionEnabled = true
        chooseUsageView.isUserInteractionEnabled = true
        choosePeopleView.isUserInteractionEnabled = true
        
        setLayout()
//        configureUI()
    }
    
    func setLayout() {
        
        contentScrollView.translatesAutoresizingMaskIntoConstraints = false
//        contentView.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        chooseUsageView.translatesAutoresizingMaskIntoConstraints = false
        choosePriceView.translatesAutoresizingMaskIntoConstraints = false
        choosePeopleView.translatesAutoresizingMaskIntoConstraints = false
        
        
        contentScrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        contentScrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        contentScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        contentScrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
//        contentView.topAnchor.constraint(equalTo: contentScrollView.topAnchor).isActive = true
//        contentView.leadingAnchor.constraint(equalTo: contentScrollView.leadingAnchor).isActive = true
//        contentView.trailingAnchor.constraint(equalTo: contentScrollView.trailingAnchor).isActive = true
//        contentView.bottomAnchor.constraint(equalTo: contentScrollView.bottomAnchor).isActive = true
        
        
        backButton.topAnchor.constraint(equalTo: contentScrollView.topAnchor, constant: AppConstants.setupExtraConstantSize(size: 20)).isActive = true
        backButton.leadingAnchor.constraint(equalTo: contentScrollView.leadingAnchor, constant: AppConstants.setupWidthConstantSize(size: 20)).isActive = true


        titleLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: AppConstants.setupExtraConstantSize(size: 20)).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: backButton.leadingAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: contentScrollView.centerXAnchor).isActive = true
        
        chooseUsageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: AppConstants.setupExtraConstantSize(size: 50)).isActive = true
        chooseUsageView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        chooseUsageView.centerXAnchor.constraint(equalTo: contentScrollView.centerXAnchor).isActive = true
        
        choosePriceView.topAnchor.constraint(equalTo: chooseUsageView.bottomAnchor, constant: AppConstants.setupExtraConstantSize(size: 70)).isActive = true
        choosePriceView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        choosePriceView.centerXAnchor.constraint(equalTo: contentScrollView.centerXAnchor).isActive = true
        
        choosePeopleView.topAnchor.constraint(equalTo: choosePriceView.bottomAnchor, constant: AppConstants.setupExtraConstantSize(size: 70)).isActive = true
        choosePeopleView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        choosePeopleView.centerXAnchor.constraint(equalTo: contentScrollView.centerXAnchor).isActive = true
        choosePriceView.bottomAnchor.constraint(equalTo: contentScrollView.bottomAnchor).isActive = true
        
        
    }
    
    func tapUI() {
        chooseUsageView.isUserInteractionEnabled = true
        chooseUsageView.addGestureRecognizer(tapChooseUsageView)
    }
    
    func configureUI() {
        contentView.widthAnchor.constraint(equalTo: contentScrollView.widthAnchor).isActive = true
    }
}