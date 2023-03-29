//
//  AppConstant.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/03/22.
//

import Foundation
import UIKit

struct AppConstants {
    static let ScreenWidth = UIScreen.main.bounds.width
    static let ScreenHeight = UIScreen.main.bounds.height
    
    // 아이패드, 아이폰 각각 constant 크기 다르게 설정
    static func setupConstantSize(size: CGFloat) -> CGFloat {
        let isiPad = UIDevice.current.userInterfaceIdiom == .pad
        var constantSize: CGFloat = 0
        
        if size < 0 {
            constantSize = isiPad ? size - 4 : size
        } else {
            constantSize = isiPad ? size + 4 : size
        }
        return constantSize
    }
}
