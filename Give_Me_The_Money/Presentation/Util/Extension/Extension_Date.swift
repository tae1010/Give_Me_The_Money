//
//  Extension_Date.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 6/10/24.
//

import Foundation

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
}
