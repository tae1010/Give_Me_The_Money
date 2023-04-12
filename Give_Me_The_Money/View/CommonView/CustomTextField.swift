//
//  TextField.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/04/11.
//

import Foundation
import UIKit

class CustomTextField: UIView {
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.nanumSquareNeoHeavy(size: 15)
        textField.textColor = .black
        
        textField.borderStyle = .none
        textField.placeholder
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.autocorrectionType = .no
        
        return textField
    }()
    
    let underView: UIView = {
        let view = UIView()
        view.backgroundColor = .primaryColor
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.isUserInteractionEnabled = true
        textField.isUserInteractionEnabled = true
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        underView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(textField)
        self.addSubview(underView)
        
        textField.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        textField.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        textField.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        textField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -3).isActive = true
        
        underView.leadingAnchor.constraint(equalTo: textField.leadingAnchor).isActive = true
        underView.trailingAnchor.constraint(equalTo: textField.trailingAnchor).isActive = true
        underView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 1).isActive = true
        underView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    
}


// MARK: - textfield click delegate
//extension CustomTextField: UITextFieldDelegate {
//    
//    // textfield click
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        print("textfield 선택")
//        textField.becomeFirstResponder()
//        textField.layer.borderColor = UIColor.primaryCGColor
//        textField.tintColor = UIColor.primaryColor
//    }
//    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        guard let text = textField.text else { return false }
//        
//        // 최대 글자수 이상을 입력한 이후에는 중간에 다른 글자를 추가할 수 없게끔 작동
//        if text.count >= 100 {
//            return false
//        }
//        return true
//    }
//    
//    
//}
