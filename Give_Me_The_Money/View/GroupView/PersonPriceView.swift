//
//  PersonalPriceView.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/04/28.
//

import Foundation
import UIKit

class PersonPriceView: UIView {
    
    let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = AppConstants.setupWidthConstantSize(size: 10)

        return stackView
    }()
    
    let sameButton: UIButton = {
        let button = UIButton()
        button.setTitle("균등하게 나누기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.nanumSquareNeoBold(size: 13)
        button.backgroundColor = .veryLightGrey
        button.layer.cornerRadius = AppConstants.setupExtraConstantSize(size: 10)
        button.addTarget(self, action: #selector(tapSameButton), for: .touchUpInside)
        return button
    }()
    
    let gameButton: UIButton = {
        let button = UIButton()
        button.setTitle("게임으로 나누기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.nanumSquareNeoBold(size: 13)
        button.backgroundColor = .veryLightGrey
        button.layer.cornerRadius = AppConstants.setupExtraConstantSize(size: 10)
        return button
    }()
    
    let leftPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "남은 금액 : "
        label.font = UIFont.nanumSquareNeoBold(size: 15)
        label.textColor = .black
        return label
    }()
    
    let leftPriceNumLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.nanumSquareNeoBold(size: 15)
        label.textColor = .black
        return label
    }()
    
    private lazy var personTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.register(PersonCell.self, forCellReuseIdentifier: "PersonCell")
        return tableView
    }()
    
    let peopleViewModel = PeopleViewModel()
    
    var test = ["가나다","김정태","ㅁㄴㅇ"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        personTableView.dataSource = self
        personTableView.delegate = self
        personTableView.rowHeight = UITableView.automaticDimension
        personTableView.estimatedRowHeight = 50
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc func tapSameButton() {
        
        let endIndex = IndexPath(row: test.count, section: 0)
        test.append("추가됨")
        personTableView.reloadData()
        personTableView.scrollToRow(at: endIndex, at: .bottom, animated: true)
        print("눌림")
    }
    
}


extension PersonPriceView {
    
    func setUI() {
        self.addSubview(buttonStackView)
        self.addSubview(leftPriceLabel)
        self.addSubview(leftPriceNumLabel)
        self.addSubview(personTableView)
        self.buttonStackView.addArrangedSubview(sameButton)
        self.buttonStackView.addArrangedSubview(gameButton)
        
        setLayout()
    }
    
    func setLayout() {
        
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        leftPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        leftPriceNumLabel.translatesAutoresizingMaskIntoConstraints = false
        personTableView.translatesAutoresizingMaskIntoConstraints = false
        
        buttonStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        buttonStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        buttonStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        leftPriceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        leftPriceLabel.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: AppConstants.setupExtraConstantSize(size: 15)).isActive = true
//        leftPriceLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        leftPriceNumLabel.topAnchor.constraint(equalTo: leftPriceLabel.topAnchor).isActive = true
//        leftPriceNumLabel.bottomAnchor.constraint(equalTo: leftPriceLabel.bottomAnchor).isActive = true
        leftPriceNumLabel.leadingAnchor.constraint(equalTo: leftPriceLabel.trailingAnchor, constant: 5).isActive = true
        leftPriceNumLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor).isActive = true
        
        personTableView.topAnchor.constraint(equalTo: leftPriceNumLabel.bottomAnchor, constant: AppConstants.setupExtraConstantSize(size: 20)).isActive = true
        personTableView.leadingAnchor.constraint(equalTo: buttonStackView.leadingAnchor).isActive = true
        personTableView.trailingAnchor.constraint(equalTo: buttonStackView.trailingAnchor).isActive = true
        personTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        personTableView.heightAnchor.constraint(equalToConstant: AppConstants.setupWidthExtraConstantSize(size: 100)).isActive = true
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
