//
//  KeyCell.swift
//  iPhoneDialPad
//
//  Created by Liu Chuan on 2019/3/22.
//  Copyright © 2019 LC. All rights reserved.
//

import UIKit

/// 集合视图单元格
class KeyCell: UICollectionViewCell {
    
    /// 数字标签
    var digitsLabel = UILabel()
    
    /// 字母标签
    var lettersLabel = UILabel()
    
    /// 默认背景色
    private let defaultBackgroundColor = UIColor(white: 0.9, alpha: 1)
    
    /// 是否高亮
    override var isHighlighted: Bool {
        didSet{ // 监听数值 `isHighlighted` 的改变, 从而修改 标签、背景的颜色
            /// 暗黑色
            let darkColor = UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1.00)
            
            // 适配暗黑模式
            if self.traitCollection.userInterfaceStyle == .dark {
                // Dark
                backgroundColor = isHighlighted ? UIColor.lightGray : darkColor
                digitsLabel.textColor = isHighlighted ? .black : .white
                lettersLabel.textColor = isHighlighted ? .black : .white
            }else {
                // Light
                backgroundColor = isHighlighted ? UIColor.lightGray : UIColor(white: 0.9, alpha: 1)
                digitsLabel.textColor = isHighlighted ? .white : .black
                lettersLabel.textColor = isHighlighted ? .white : .black
            }
        }
    }
    
    // MARK: - initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = defaultBackgroundColor
        
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
        
        // 设置子视图的布局方向
        stackView.axis = .vertical
        
        // 间隙
        stackView.spacing = 0
        
        // 子视图的填充方式
        /*
         case fill
         case fillEqually
         case fillProportionally
         case equalSpacing
         case equalCentering
         */
        //子视图的高度或宽度保持一致
        //stackView.distribution = .fillEqually
        
        // 子视图的对齐方式
        //stackView.alignment = .center
       
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
