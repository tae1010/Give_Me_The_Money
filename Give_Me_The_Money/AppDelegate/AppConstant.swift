//
//  AppConstant.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/03/22.
//

import Foundation
import UIKit

struct AppConstants {
    
    static let isiPad = UIDevice.current.userInterfaceIdiom == .pad
    
    static let ScreenWidth = UIScreen.main.bounds.width
    static let ScreenHeight = UIScreen.main.bounds.height
    
    // 아이패드, 아이폰 각각 constant 크기 다르게 설정
    static func setupNormalConstantSize(size: CGFloat) -> CGFloat {
        let constantSize = isiPad ? size + (size < 0 ? -4 : 4) : size
        return constantSize
    }
    

    static func setupExtraConstantSize(size: CGFloat) -> CGFloat {
        let constantSize = isiPad ? size + (size < 0 ? -10 : 10) : size
        return constantSize
    }
    
    static func setupWidthConstantSize(size: CGFloat) -> CGFloat {
        let constantSize = isiPad ? size + (size < 0 ? -30 : 30) : size
        return constantSize
    }
    
    static func setupNormalMultiplierSize(size: CGFloat) -> CGFloat {
        let constantSize = isiPad ? size + 0.05 : size
        return constantSize
    }
    
    
    static func setupExtraMultiplierSize(size: CGFloat) -> CGFloat {
        let constantSize = isiPad ? size + 0.2 : size
        return constantSize
    }
    

}
