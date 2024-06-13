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
    var totalPrice: Int = 0
//    var calculate: [Calculate] // calcuate 배열은 외래키 형식으로 해결
    // totalPrice는 calculate에서 price값을 모두 더하는 로직으로...
}

// calculate에서 game모드일때나 기본 모드일때나 달라지는건 없음
struct Calculate {
    var id: Int // id
    var mainCalculateId: Int
    var status: calculateStatus = .normal // calculate가 어떤 모드인지 (기본은 normal상태)
    var usage: String // ex) 숙박비, 교통비...
    var price: Int // 가격
    var user: Users // 이용자
    var userPrice: Int // 각 이용자마다 적용된 가격
    var remainPrice: Int // 남은 금액
    var date: Date // 적용한 날짜
}

/*
 1. mainCalculate모델에서 calculate배열 포함시키기 : calculate 모델을 sqlite에서 어떻게 crud하는지 잘 모르겟음
 2. calculate모델에서 mainCalculate모델 id를 외래키로 사용 : calculate에서 수정이 완료될 때 mainCalculate 데이터를 수정해야 하는데 이게 clean architecture를 위반하는지 잘 모르겠음
 (2번상세 calculate usecase에서 maincalculate쪽을 건들여도 되는지 의문)
 */

/*
 시나리오
 1. 처음 메인창에서 mainCalculate의 totalPrice는 0원으로 설정.
 2. calculate창에서 cell을 만든 후 저장을 하면 mainCalculate에 있는 totalPrice를 변경하는 useCase작성
 3. 메인창으로 들어가면 변경된 totalPrice를 적용되게 하기
 */

/*
 외래키를 사용하자!
 A useCase에서 B usecase에 접근하여 변화를 주는게 나을듯
 즉 A, B 모두 Repository crud는 동일하지만 mainCalculate usecase쪽에서 calculate쪽을 read하는 repository protocol을 사용해서 불러오고 totalPrice를 저장
 */
