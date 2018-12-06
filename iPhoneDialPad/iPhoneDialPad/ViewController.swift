//
//  ViewController.swift
//  iPhoneDialPad
//
//  Created by Liu Chuan on 2019/3/22.
//  Copyright © 2019 LC. All rights reserved.
//

import UIKit


private let cellID = "cellID"
private let headerID = "headerID"
private let greenButtonCellID = "greenButtonCellID"
private let backspaceCellID = "backspaceCellID"




class ViewController: UICollectionViewController {
    
    // MARK: - Attribute
    /// 字母
    let letters = [
        "", "A B C", "D E F", "G H I", "J K L", "M N O", "P Q R S", "T U V", "W X Y Z", "", "+", ""
    ]
    
    /// 数字
    let numbers = [
        "1", "2", "3", "4", "5", "6", "7", "8", "9", "*", "0", "#"
    ]
    
    /// 已拨号码显示字符串
    private lazy var DialedNumbersDisplayString = ""
    
    /// 左右边距
    private lazy var leftRightPadding = view.frame.width * 0.15
    
    /// 间隔
    private lazy var interSpacing = view.frame.width * 0.1
    
    /// 每行cell的个数
    private lazy var count: CGFloat = 3
    
    /// cell宽度
    private lazy var cellWidth = (view.frame.width - leftRightPadding * 2 - interSpacing * 2) / count
    
    
    // MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical  // 设置布局方向为: 水平滚动
        
        collectionView.backgroundColor = .white
        collectionView.collectionViewLayout = layout
        collectionView.register(KeyCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.register(GreenCallButtonCell.self, forCellWithReuseIdentifier: greenButtonCellID)
        collectionView.register(BackspaceCell.self, forCellWithReuseIdentifier: backspaceCellID)
        collectionView.register(DialedNumbersHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
    }

    // MARK: - UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 {
            return 2
        }
        return numbers.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 1 { // 1组0行 绿色拨号cell
            if indexPath.item == 0 {
                let greenButtonCell = collectionView.dequeueReusableCell(withReuseIdentifier: greenButtonCellID, for: indexPath) as! GreenCallButtonCell
                return greenButtonCell
            }else { // 退格键cell
                let backspaceCell = collectionView.dequeueReusableCell(withReuseIdentifier: backspaceCellID, for: indexPath) as! BackspaceCell
                return backspaceCell
            }
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! KeyCell
        cell.digitsLabel.text = numbers[indexPath.item]
        cell.lettersLabel.text = letters[indexPath.item]
        return cell
    }
    
    /* 头部视图 */
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! DialedNumbersHeader
        header.numbersLabel.text = DialedNumbersDisplayString
        return header
    }
    
    // MARK: - UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 退格cell的index
        if indexPath.section == 1 {
            if indexPath.item == 1 {
                //dropLast(): 返回包含序列的最后一个元素以外的所有元素的子序列。达到删除效果
                DialedNumbersDisplayString = String(DialedNumbersDisplayString.dropLast())
            }
        }else {
            /// 取出当前选择的item的数字
            let number = numbers[indexPath.item]
            // 修改已拨号码显示的字符串
            DialedNumbersDisplayString += number
        }
        // 重新加载collectionView
        collectionView.reloadData()
    }
}


// MARK: - UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    /* UICollectionViewLayout */
    
    // itemSize属性
    // 设定全局的Cell尺寸，如果想要单独定义某个Cell的尺寸，可以使用该方法：
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: cellWidth, height: cellWidth)
    }
    
    // minimumLineSpacing属性
    // 设定全局的行间距，如果想要设定指定区内Cell的最小行距，可以使用该方法：
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    // sectionInset属性
    // 设定全局的区内边距，如果想要设定指定区的内边距，可以使用该方法：
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if section == 1 {
            /// 左边边距
            let leftPadding = view.frame.width / 2 - cellWidth / 2
            return .init(top: 0, left: leftPadding, bottom: 0, right: self.leftRightPadding)
        }
        return .init(top: 16, left: leftRightPadding, bottom: 16, right: leftRightPadding)
    }
    
    // headerReferenceSize 属性与 footerReferenceSize 属性
    // 设置页眉（头部视图）全局尺寸，需要注意的是，根据滚动方向不同，header和footer的width和height中只有一个会起作用。如果要单独设置指定区内的页面和页脚尺寸，可以使用该方法：
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 1 {
            return .zero
        }
        /// 高度
        let height = view.frame.height * 0.2
        return .init(width: view.frame.width, height: height)
    }
    
}
