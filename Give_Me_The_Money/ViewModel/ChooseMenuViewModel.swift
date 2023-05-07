//
//  ChooseMenuViewModel.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/03/28.
//

import Foundation
import RxCocoa
import RxSwift


enum SideButtonMode {
    case game
    case group
}

class ChooseMenuViewModel {
    
    let disposedBag = DisposeBag()
    var sideMenuStatusRelay = PublishRelay<SideButtonMode>() // 어떤 사이드 메뉴를 선택하는지
    var sideMenuStatus: SideButtonMode = .group
    var checkMakeButtonIsEnabled = BehaviorRelay<Bool>(value: false)
    
    init() {
        print("ChooseMenuViewModel init")
        
        sideMenuStatusRelay.bind(onNext: { [ weak self ] status in
            guard let self = self else { return }
            print(status,"버튼상태")
            self.sideMenuStatus = status
            self.checkMakeButtonIsEnabled.accept(true)
        }).disposed(by: disposedBag)
        
        
    }
    

    
}
