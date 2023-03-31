//
//  GropuCell.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 2023/03/31.
//

import Foundation
import UIKit

class GroupCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
