//
//  ViewController.swift
//  iPhoneDialPad
//
//  Created by Liu Chuan on 2019/3/22.
//  Copyright © 2019 LC. All rights reserved.
//

import UIKit


/// 单元格重用标识符
private let cellID = "cellID"


class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    /// 字母
    let letters = [
        "", "A B C", "D E F", "G H I", "J K L", "M N O", "P Q R S", "T U V", "W X Y Z", "", "+", ""
    ]
    /// 数字
    let numbers = [
        "1", "2", "3", "4", "5", "6", "7", "8", "9", "*", "0", "#"
    ]
    
    // MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: 20, height: 20)       // 设置单元格的大小
        layout.minimumLineSpacing = 16                          // 设置单元格之间的最小 行间距
//        layout.minimumInteritemSpacing = 0                  // 设置单元格之间的最小 列间距
        layout.scrollDirection = .vertical                      // 设置布局方向为: 水平滚动
        
        collectionView.backgroundColor = .white
        collectionView.collectionViewLayout = layout
        collectionView.register(KeyCell.self, forCellWithReuseIdentifier: cellID)
    }

    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbers.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! KeyCell
        cell.digitsLabel.text = numbers[indexPath.item]
        cell.lettersLabel.text = letters[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("tap cell.....")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        /// 左右间距
        let leftRightPadding = view.frame.width * 0.15
        
        /// 间隔
        let interSpacing = view.frame.width * 0.1
        
        /// cell宽度
        let cellWidth = (view.frame.width - leftRightPadding * 2 - interSpacing * 2) / 3
        
        return .init(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        /// 左右间距
        let leftRightPadding = view.frame.width * 0.15
        
        /// 间隔
//        let interSpacing = view.frame.width * 0.1
        
        return .init(top: 16, left: leftRightPadding, bottom: 16, right: leftRightPadding)
    }
    
    
}
