//
//  Calculate.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 3/1/24.
//

import Foundation

struct Calculate {
    var id: Int // id
    var usage: String // ex) 숙박비, 교통비...
    var price: Int // 가격
    var user: Users // 이용자
    var userPrice: Int // 각 이용자마다 적용된 가격
    var remainPrice: Int // 남은 금액
    var date: Date // 적용한 날짜
}
