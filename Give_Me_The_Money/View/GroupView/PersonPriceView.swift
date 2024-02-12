//
//  PersonalPriceView.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/04/28.
//

import Foundation
import UIKit
import RxSwift

class PersonPriceView: UIView {
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "남은 금액 : "
        label.font = UIFont.nanumSquareNeoBold(size: 15)
        label.textColor = .black
        label.isUserInteractionEnabled = true
        return label
    }()
    
    let priceNumLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.nanumSquareNeoBold(size: 15)
        label.textColor = .black
        return label
    }()
    
    private lazy var personTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.register(PersonCell.self, forCellReuseIdentifier: "PersonCell")
        return tableView
    }()
    
    let peopleViewModel = PeopleViewModel()
    
    let disposeBag = DisposeBag()
    
    var test = [String]() // table view cell
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        personTableView.dataSource = self
        personTableView.delegate = self
        personTableView.rowHeight = UITableView.automaticDimension
        
        let tapBackGroundViewGesture = UITapGestureRecognizer()
        self.priceLabel.addGestureRecognizer(tapBackGroundViewGesture)
        
        tapBackGroundViewGesture.rx.event.bind(onNext: { recognizer in
            self.test.insert("추가됨", at: 0)
            print(self.test)
            self.personTableView.heightAnchor.constraint(greaterThanOrEqualToConstant: CGFloat(self.test.count * 55)).isActive = true
            self.personTableView.reloadData()
            self.personTableView.layoutIfNeeded()
            
        }).disposed(by: disposeBag)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

extension PersonPriceView {
    
    func setUI() {
        self.addSubview(priceLabel)
        self.addSubview(priceNumLabel)
        self.addSubview(personTableView)
        
        setLayout()
    }
    
    func setLayout() {
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceNumLabel.translatesAutoresizingMaskIntoConstraints = false
        personTableView.translatesAutoresizingMaskIntoConstraints = false
        
        priceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        priceLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: AppConstants.setupExtraConstantSize(size: 15)).isActive = true
        
        priceNumLabel.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor).isActive = true
        priceNumLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 5).isActive = true
        priceNumLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor).isActive = true
        
        personTableView.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: AppConstants.setupExtraConstantSize(size: 20)).isActive = true
        personTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        personTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        personTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        personTableView.heightAnchor.constraint(greaterThanOrEqualToConstant: AppConstants.setupWidthExtraConstantSize(size: 0)).isActive = true
    }
}

extension PersonPriceView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return test.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as? PersonCell else { return UITableViewCell() }
        
        cell.personLabel.text = test[indexPath.row]
        
        return cell
    }
    
    
}
