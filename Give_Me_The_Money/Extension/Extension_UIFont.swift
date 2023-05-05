//
//  Extension_UIFont.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/03/27.
//

import Foundation
import UIKit

extension UIFont {
    
    static func nanumSquareNeoExtrabold(size: CGFloat) -> UIFont? {
        return UIFont(name: "NanumSquareNeoTTF-dEb", size: setupFontSize(size: size))
    }
    
    static func nanumSquareNeoBold(size: CGFloat) -> UIFont? {
        return UIFont(name: "NanumSquareNeoTTF-cBd", size: setupFontSize(size: size))
    }
    
    static func nanumSquareNeo(size: CGFloat) -> UIFont? {
        return UIFont(name: "NanumSquareNeoTTF-bRg", size: setupFontSize(size: size))
    }
    
    static func nanumSquareNeoLight(size: CGFloat) -> UIFont? {
        return UIFont(name: "NanumSquareNeoTTF-aLt", size: setupFontSize(size: size))
    }
    
    static func nanumSquareNeoHeavy(size: CGFloat) -> UIFont? {
        return UIFont(name: "NanumSquareNeoTTF-eHv", size: setupFontSize(size: size))
    }
    
    // 아이패드, 아이폰 각각 폰트크기 다르게 설정 (화면 크기에 따라서도 조금씩 다르게 설정)
    static func setupFontSize(size: CGFloat) -> CGFloat {
        let isiPad = UIDevice.current.userInterfaceIdiom == .pad
        let fontSize: CGFloat = isiPad ? size + 8 : AppConstants.ScreenWidth < 400 ? size - 2 : size
        
        return fontSize
    }
}

