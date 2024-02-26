//
//  UserSettingViewController.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2024/02/08.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

protocol UserSettingViewControllerDelegate {
    func dismissToUserSettingView()
}

class UserSettingViewController: UIViewController {
    
    let backButton = BackButton()
    
    let userSettingTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.nanumSquareNeoBold(size: 30)
        label.text = "인원설정"
        label.textColor = .black
        return label
    }()
    
    let fixImageView: UIImageView = {
        let logoView = UIImageView()
        logoView.image = UIImage(named: "pencil")
        return logoView
    }()
    
    let userTextField = CustomTextField()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("추가", for: .normal)
        button.setTitleColor(UIColor.primaryColor, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let personTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.register(SettingCell.self, forCellReuseIdentifier: "SettingCell")
        return tableView
    }()
    
    let disposeBag = DisposeBag()
    
    let items = Observable.just([
        "First Item",
        "Second Item",
        "Third Item"
    ])
    
    var delegate: UserSettingViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("user setting View viewDidLoad")
        self.view.backgroundColor = .white
        setUI()
        
        backButton.rx.tap.bind(onNext: {
            self.delegate?.dismissToUserSettingView()
        }).disposed(by: disposeBag)
        
        items
            .bind(to: personTableView.rx.items(cellIdentifier: "SettingCell", cellType: SettingCell.self)) { (row, element, cell) in
//                cell.textLabel?.text = "\(element) @ row \(row)"
            }
            .disposed(by: disposeBag)

        
        
        // cell 클릭
        personTableView.rx.itemSelected.bind(onNext: { indexPath in
            
            let cell = self.personTableView.cellForRow(at: indexPath) as! SettingCell
            cell.selectionStyle = .none
            
            print("personCell에서 클릭된 cell의 index: \(indexPath.row)")
            
        }).disposed(by: disposeBag)

    }
}

extension UserSettingViewController {
    
    func setUI() {
        self.view.addSubview(backButton)
        self.view.addSubview(userSettingTitleLabel)
        self.view.addSubview(fixImageView)
        self.view.addSubview(userTextField)
        self.view.addSubview(addButton)
        self.view.addSubview(personTableView)
        
        setLayout()
    }
    
    func setLayout() {
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        userSettingTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        fixImageView.translatesAutoresizingMaskIntoConstraints = false
        userTextField.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        personTableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.backButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: AppConstants.setupExtraConstantSize(size: 20)).isActive = true
        self.backButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: AppConstants.setupWidthConstantSize(size: 20)).isActive = true
        
        self.userSettingTitleLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 40).isActive = true
        self.userSettingTitleLabel.leadingAnchor.constraint(equalTo: backButton.leadingAnchor).isActive = true
        
        self.fixImageView.leadingAnchor.constraint(equalTo: userSettingTitleLabel.trailingAnchor, constant: 5).isActive = true
        self.fixImageView.bottomAnchor.constraint(equalTo: userSettingTitleLabel.bottomAnchor).isActive = true
        self.fixImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        self.fixImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        self.userTextField.topAnchor.constraint(equalTo: userSettingTitleLabel.bottomAnchor, constant: 50).isActive = true
        self.userTextField.leadingAnchor.constraint(equalTo: userSettingTitleLabel.leadingAnchor).isActive = true
        
        self.addButton.centerYAnchor.constraint(equalTo: userTextField.centerYAnchor).isActive = true
        self.addButton.leadingAnchor.constraint(equalTo: userTextField.trailingAnchor, constant: 10).isActive = true
        self.addButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        
        self.personTableView.topAnchor.constraint(equalTo: userTextField.bottomAnchor, constant: 10).isActive = true
        self.personTableView.leadingAnchor.constraint(equalTo: userSettingTitleLabel.leadingAnchor).isActive = true
        self.personTableView.trailingAnchor.constraint(equalTo: addButton.trailingAnchor).isActive = true
        self.personTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
}
