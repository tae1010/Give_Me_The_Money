//
//  MainViewModel.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/05/05.
//

import Foundation
import RxCocoa
import RxSwift

/*
 있어야 할것
 1. collectioview cell 관리 객체
 - Group, Game 구조체
 - 가격 정리 표?
 */

class MainViewModel {

    var items = BehaviorRelay<[String]>(value: [])
    
    // db값(인원)을 저장할 변수
    var item = ["김정태","가나다","가나다","가나다","가나나나다","가나다","가나다서","가나다대리","가가"]
    
    //cell이 선택된지 확인
    var isSelect = [Bool]()
    
    init() {
        print("메인뷰모델 init")
        
        items.accept(["김정태","가나다","가나다","가나다","가나나나다","가나다","가나다서","가나다대리","가가"])
        isSelect = [Bool](repeating: false, count: item.count)
        
    }
}
