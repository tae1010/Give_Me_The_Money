//
//  CloseButton.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/04/09.
//

import Foundation
import UIKit

class CloseButton: UIButton {
    
    var clickAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setImage(UIImage(named: "closeButton"), for: .normal)
        self.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc private func buttonClicked() {
        // 버튼 클릭 이벤트가 발생했을 때 실행될 코드를 여기에 작성합니다.
        self.clickAction?()
    }
}


