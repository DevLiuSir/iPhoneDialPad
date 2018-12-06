//
//  GreenCallButtonCell.swift
//  iPhoneDialPad
//
//  Created by Liu Chuan on 2019/3/30.
//  Copyright © 2019 LC. All rights reserved.
//

import UIKit

/// 绿色拨号按钮cell
class GreenCallButtonCell: UICollectionViewCell {
    
    let imageView = UIImageView(image: #imageLiteral(resourceName: "dialing"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.contentMode = .scaleToFill
        addSubview(imageView)
        imageView.centerInSuperview(size: .init(width: frame.width, height: frame.width))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.width / 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}
