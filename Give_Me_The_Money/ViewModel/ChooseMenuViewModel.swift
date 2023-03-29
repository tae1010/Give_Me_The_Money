//
//  ChooseMenuViewModel.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/03/28.
//

import Foundation
import RxCocoa
import RxSwift

enum ButtonSelect {
    case normal
    case highlighted
}

class ChooseMenuViewModel {
    
    let disposedBag = DisposeBag()
    var sideMenuStatus = PublishRelay<SideButtonMode>() // 어떤 사이드 메뉴를 선택하는지?
    
    let labelState = BehaviorRelay<ButtonSelect>(value: .normal)
    let imageState = BehaviorRelay<ButtonSelect>(value: .normal)
    
    init() {
        print("ChooseMenuViewModel init")
        
        sideMenuStatus.bind(onNext: { status in
            print(status)
        }).disposed(by: disposedBag)
    }
    
    func handleTap() {
        let newState: ButtonSelect = (labelState.value == .normal) ? .highlighted : .normal
        labelState.accept(newState)
        imageState.accept(newState)
    }

    
}
