//
//  ChartView.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/04/06.
//

import Foundation
import UIKit

class ChartView: UIView, CAAnimationDelegate {
    
    var circleSize: CGFloat = 0
    
    init(circleSize: CGFloat) {
        super.init(frame: .zero)
        self.circleSize = circleSize
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        let colors: [UIColor] = [.customRedColor, .customGreenColor, .customYellowColor]

        var colorIndex = 0
        
        let values: [CGFloat] = [10, 20, 70]
        let total = values.reduce(0, +)
        
        //x degree = x * π / 180 radian
        var startAngle: CGFloat = (-(.pi) / 2)
        var endAngle: CGFloat = 0.0
        
        values.forEach { (value) in
            endAngle = (value / total) * (.pi * 2)
            
            let path = UIBezierPath()
            path.move(to: center)
            path.addArc(withCenter: center,
                        radius: circleSize,
                        startAngle: startAngle,
                        endAngle: startAngle + endAngle,
                        clockwise: true)
            
            colors[colorIndex].set()
            colorIndex += 1
            if colorIndex >= colors.count {
                colorIndex = 0
            }
            
            path.fill()
            startAngle += endAngle
            path.close()
            
            // slice space
            UIColor.white.set()
            path.lineWidth = 3
            path.stroke()
        }
        
        let semiCircle = UIBezierPath(arcCenter: center,
                                      radius: circleSize - 10,
                                      startAngle: 0,
                                      endAngle: (360 * .pi) / 180,
                                      clockwise: true)
        UIColor.white.set()
        semiCircle.fill()
    }
    
}
