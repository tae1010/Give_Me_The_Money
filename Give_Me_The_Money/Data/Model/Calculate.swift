//
//  Calculate.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 3/1/24.
//

import Foundation

enum calculateStatus {
    case normal
    case game
}

struct MainCalculate {
    var id: Int // id
    var titleUsage: String
//    var calculate: [Calculate] // calcuate 배열은 외래키 형식으로 해결
    // totalPrice는 calculate에서 price값을 모두 더하는 로직으로...
}

struct Calculate {
    var id: Int // id
    var mainCaluclateId: Int // mainCalculate id (외래키)
    var status: calculateStatus = .normal // calculate가 어떤 모드인지 (기본은 normal상태)
    var usage: String // ex) 숙박비, 교통비...
    var price: Int // 가격
    var user: Users // 이용자
    var userPrice: Int // 각 이용자마다 적용된 가격
    var remainPrice: Int // 남은 금액
    var date: Date // 적용한 날짜
}

// calculate에서 game모드일때나 기본 모드일때나 달라지는건 없음
