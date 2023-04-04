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
    
    init() {
        print("메인뷰모델 init")
        
        items.accept(["aaa","bbb","ccc","ddd","eee","hhh","iii"])
        
    }
}
