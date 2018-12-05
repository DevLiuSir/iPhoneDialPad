//
//  DialedNumbersHeader.swift
//  iPhoneDialPad
//
//  Created by Liu Chuan on 2019/3/24.
//  Copyright © 2019 LC. All rights reserved.
//

import UIKit

/// 已拨号码头部视图
class DialedNumbersHeader: UICollectionReusableView {
    
    /// 数字标签
    public lazy var numbersLabel: UILabel = {
        let label = UILabel()
        label.text = "123"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 32)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    // MARK: - View initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(numbersLabel)
        numbersLabel.fillSuperview(padding: UIEdgeInsets(top: 0, left: 32, bottom: 0, right: 32))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
