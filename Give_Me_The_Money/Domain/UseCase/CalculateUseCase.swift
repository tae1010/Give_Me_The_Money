//
//  CalculateUseCase.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 3/9/24.
//

import Foundation
import UIKit
import RxSwift

class CalculateUseCase {
    let repository = SQLiteCalculateRepository()
    let disposeBag = DisposeBag()
    
    init() {
        readCalculate()
    }
    
    func readCalculate() {
        repository.read()
            .subscribe(onSuccess: { calculates in
                print("계산 정보:")
                for calculate in calculates {
                    print("ID: \(calculate.id), Usage: \(calculate.usage), Price: \(calculate.price), User Price: \(calculate.userPrice), Remain Price: \(calculate.remainPrice), Date: \(calculate.date)")
                }
            }, onFailure: { error in
                print("계산 정보를 읽어오는 동안 오류가 발생했습니다: \(error)")
            })
            .disposed(by: disposeBag)
    }
    
    
}
