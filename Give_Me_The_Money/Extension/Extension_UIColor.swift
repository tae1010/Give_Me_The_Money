//
//  Extension_UIColor.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/03/22.
//

import Foundation
import UIKit

extension UIColor {
    class var primaryColor: UIColor { return UIColor(named: "primaryColor")! }
    class var primaryCGColor: CGColor { return UIColor.primaryColor.cgColor }
    
    class var veryLightGrey: UIColor { return UIColor(named: "veryLightGrey")! }
    class var veryLightGreyCGColor: CGColor { return UIColor.veryLightGrey.cgColor }
    
    class var veryveryLightGrey: UIColor { return UIColor(named: "veryveryLightGrey")! }
    class var veryveryLightGreyCGColor: CGColor { return UIColor.veryveryLightGrey.cgColor }
    
    class var lightPrimaryColor: UIColor { return UIColor(named: "lightPrimaryColor")! }
    class var lightPrimaryCGColor: CGColor { return UIColor.lightPrimaryColor.cgColor }
    
    class var customYellowColor: UIColor { return UIColor(named: "customYellow")! }
    class var customYellowCGColor: CGColor { return UIColor.customYellowColor.cgColor }
    
    class var customRedColor: UIColor { return UIColor(named: "customRed")! }
    class var customRedCGColor: CGColor { return UIColor.customRedColor.cgColor }
    
    class var customGreenColor: UIColor { return UIColor(named: "customGreen")! }
    class var customGreenCGColor: CGColor { return UIColor.customGreenColor.cgColor }
    
    class var noSelectColor: UIColor { return UIColor(named: "noSelectColor")! }
    class var noSelectCGColor: CGColor { return UIColor.noSelectColor.cgColor }
    
    
}
