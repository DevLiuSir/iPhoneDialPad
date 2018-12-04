//
//  KeyCell.swift
//  iPhoneDialPad
//
//  Created by Liu Chuan on 2019/3/22.
//  Copyright © 2019 LC. All rights reserved.
//

import UIKit

class KeyCell: UICollectionViewCell {
    
    /// 数字标签
    var digitsLabel = UILabel()
    
    /// 字母标签
    var lettersLabel = UILabel()
    
    // MARK: - initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(white: 0.9, alpha: 1)
        
        digitsLabel.text = "0"
        digitsLabel.textAlignment = .center
        digitsLabel.font = UIDevice.current.screenType == .iPhones_5_5s_5c_SE ? UIFont.systemFont(ofSize: 24) : UIFont.systemFont(ofSize: 32)
        
        
        lettersLabel.text = "A B C"
        lettersLabel.textAlignment = .center
        lettersLabel.font = UIDevice.current.screenType == .iPhones_5_5s_5c_SE ? UIFont.boldSystemFont(ofSize: 8) : UIFont.boldSystemFont(ofSize: 10)
        
        /*
         init(arrangedSubviews views: [UIView])：同样是创建一个 UIStackView，
                    但我们可以将子视图传入。views 数组里的顺序即为子视图显示的顺序。
         */
        let stackView = UIStackView(arrangedSubviews: [digitsLabel, lettersLabel])
        
        
//        stackView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        
        // 设置子视图的布局方向
        stackView.axis = .vertical
        
        // 间隙
//        stackView.spacing = 1
        
        // 子视图的填充方式
        /*
         case fill
         case fillEqually
         case fillProportionally
         case equalSpacing
         case equalCentering
         */
//        //子视图的高度或宽度保持一致
//        stackView.distribution = .fillEqually
        
//        // 子视图的对齐方式
//        stackView.alignment = .center
       
        
        addSubview(stackView)
        stackView.centerInSuperview()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    // 布置子视图是调用
    override func layoutSubviews() {
        
        layer.cornerRadius = frame.width / 2
    }
    
    
}
