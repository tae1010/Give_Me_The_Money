//
//  Extension_UIColor.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/03/22.
//

import Foundation
import UIKit

extension UIColor {
    class var primaryColor: UIColor? { return UIColor(named: "primaryColor") }
    class var primaryCGColor: CGColor { return UIColor.primaryColor!.cgColor }
    
    class var veryLightGrey: UIColor? { return UIColor(named: "veryLightGrey") }
    class var veryLightGreyCGColor: CGColor { return UIColor.veryLightGrey!.cgColor }
    
    class var lightPrimaryColor: UIColor? { return UIColor(named: "lightPrimaryColor") }
    class var lightPrimaryCGColor: CGColor { return UIColor.lightPrimaryColor!.cgColor }
}
