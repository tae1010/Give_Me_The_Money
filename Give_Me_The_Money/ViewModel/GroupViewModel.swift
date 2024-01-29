//
//  MainViewModel.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/03/28.
//

import Foundation
import RxCocoa
import RxSwift

class GroupViewModel {
    
    var chooseUsage = BehaviorRelay<String>(value: "")
    var choosePeople = BehaviorRelay<[String]>(value: [])
    
    // db값(인원)을 저장할 변수
    var choosePeopleArray = ["김정태","가나다","가나다","가나다","가나나나다","가나다","가나다서","가나다대리","가가"]
    
    //cell이 선택된지 확인
    var isSelect = [Bool]()
    
    init() {
        print("메인뷰모델 init")
        
        choosePeople.accept(["김정태"])
        isSelect = [Bool](repeating: false, count: choosePeopleArray.count)
        
    }
    
    func addPeople() {
        self.choosePeopleArray.append("추가")
    }
}
