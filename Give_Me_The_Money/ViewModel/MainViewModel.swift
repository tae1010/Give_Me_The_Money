//
//  MainViewModel.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/03/28.
//

import Foundation
import RxCocoa
import RxSwift

class MainViewModel {
    var items = BehaviorRelay<[String]>(value: [])
    var item = ["김정태","가나다","가나다","가나다","가나나나다","가나다","가나다서","가나다대리","가가"]
    var isSelect = [Bool]()
    
    init() {
        print("메인뷰모델 init")
        
        items.accept(["김정태","가나다","가나다","가나다","가나나나다","가나다","가나다서","가나다대리","가가"])
        isSelect = [Bool](repeating: false, count: item.count)
        
    }
}
