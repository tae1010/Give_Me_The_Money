//
//  UserPreSetView.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2024/02/14.
//

import Foundation
import UIKit


class UserPreSetView: UIView, UITextFieldDelegate {
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.nanumSquareNeoHeavy(size: 15)
        textField.textColor = .black
        textField.textAlignment = .center
        textField.borderStyle = .none
        textField.keyboardType = .numberPad
        
        textField.leftViewMode = .always
        textField.autocorrectionType = .no
        
        return textField
    }()
    
    let underView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textField.delegate = self
        
        self.isUserInteractionEnabled = true
        textField.isUserInteractionEnabled = true
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        underView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(textField)
        self.addSubview(underView)
        
        textField.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10).isActive = true
        textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        textField.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        textField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -3).isActive = true
        
        underView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        underView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        underView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 1).isActive = true
        underView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
}
