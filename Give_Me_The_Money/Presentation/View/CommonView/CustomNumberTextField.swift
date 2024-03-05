//
//  TextField.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/04/11.
//

import Foundation
import UIKit

class CustomNumberTextField: UIView {
    
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


// MARK: - textfield click delegate
extension CustomNumberTextField: UITextFieldDelegate {
    
    // textfield click
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textfield 선택")
        textField.becomeFirstResponder()
        textField.tintColor = UIColor.primaryColor
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // 새로운 문자열을 계산
        let currentText = textField.text ?? ""
        let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        // 숫자만 있는지 확인
        let isNumeric = newText.isEmpty || (Double(newText) != nil)
        
        // 총 길이 확인
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        formatter.maximumFractionDigits = 0
        let numberWithCommas = formatter.string(from: NSNumber(value: Int(newText) ?? 0)) ?? ""
        let maxLength = numberWithCommas.count + (numberWithCommas.count-1)/3
        
        return isNumeric && maxLength <= 15
    }
    
}
