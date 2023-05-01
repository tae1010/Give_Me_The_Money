//
//  Extension_ViewController.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/05/01.
//

import Foundation
import UIKit

extension UIViewController {

    // 뷰를 클릭하면 키보드가 내려감
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        print("tab")
        view.endEditing(true)
    }

}
