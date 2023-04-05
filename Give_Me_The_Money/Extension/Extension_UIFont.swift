//
//  Extension_UIFont.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/03/27.
//

import Foundation
import UIKit

extension UIFont {

//    static func nanumGothicExtraBold(size: CGFloat) -> UIFont? {
//        return UIFont(name: "NanumGothicOTFExtraBold", size: setupFontSize(size: size))
//    }
//
//    static func nanumGothicBold(size: CGFloat) -> UIFont? {
//        return UIFont(name: "NanumGothicOTFBold", size: setupFontSize(size: size))
//    }
//
//    static func nanumGothic(size: CGFloat) -> UIFont? {
//        return UIFont(name: "NanumGothicOTF", size: setupFontSize(size: size))
//    }
//
//    static func nanumGothicLight(size: CGFloat) -> UIFont? {
//        return UIFont(name: "NanumGothicOTFLight", size: setupFontSize(size: size))
//    }
    
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
    
    // 아이패드, 아이폰 각각 폰트크기 다르게 설정
    static func setupFontSize(size: CGFloat) -> CGFloat {
        let isiPad = UIDevice.current.userInterfaceIdiom == .pad
        let fontSize: CGFloat = isiPad ? size + 6 : size
        
        return fontSize
    }
}

