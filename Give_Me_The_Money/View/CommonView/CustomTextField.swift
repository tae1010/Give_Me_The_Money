//
//  CustomTextField.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/05/07.
//

import Foundation
import UIKit

class CustomTextField: UIView {
    
    var beforeText = ""
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.nanumSquareNeoHeavy(size: 18)
        textField.textColor = .black
        textField.borderStyle = .none
        
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


// MARK: - textfield click delegate
extension CustomTextField: UITextFieldDelegate {
    
    // 글자수 30글자 + 백스페이스 누를때는 반응
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let char = string.cString(using: String.Encoding.utf8) {
            let isBackSpace = strcmp(char, "\\b")
            if isBackSpace == -92 {
                return true
            }
        }
        guard textField.text!.count < 30 else { return false }
        return true
    }
    
}

