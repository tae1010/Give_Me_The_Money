//
//  Group.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/03/28.
//

import Foundation

// 용도, 가격, 이용자, 나누는 방식(균등 or 직접입력 or 내기)
struct DetailCalculate {
    var usage: String
    var price: Int
    var user: Users
    var userPrice: Int
    var remainPrice: Int
    var date: Date
}
