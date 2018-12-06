//
//  BackspaceCell.swift
//  iPhoneDialPad
//
//  Created by Liu Chuan on 2019/3/30.
//  Copyright © 2019 LC. All rights reserved.
//

import UIKit

/// 退格键cell
class BackspaceCell: UICollectionViewCell {
    
    let imageView = UIImageView(image: #imageLiteral(resourceName: "backspace"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        imageView.centerInSuperview(size: .init(width: 40, height: 40))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.width / 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}
