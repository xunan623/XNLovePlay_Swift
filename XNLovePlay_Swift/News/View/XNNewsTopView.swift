//
//  XNNewsTopView.swift
//  XNLovePlay_Swift
//
//  Created by xunan on 2017/4/12.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

class XNNewsTopView: UIView {

    var titleArray: [String] = [String]()
    let selectBottomLine: UIView = UIView()
    var currentSelectedBtn: UIButton?

    init(frame: CGRect, titleArray: [String]) {
        self.titleArray = titleArray
        super.init(frame: frame)
        
        createUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension XNNewsTopView {
    fileprivate func createUI() {
        self.backgroundColor = UIColor.black
        
        let btnW = self.frame.size.width / CGFloat(self.titleArray.count)
        for (index, title) in self.titleArray.enumerated() {
            let btn = UIButton.init(type: .custom)
            btn.frame = CGRect.init(x: btnW * CGFloat(index), y: 18, width: btnW, height: 42)
            btn.setTitle(title, for: .normal)
            btn.setTitleColor(UIColor.white, for: .normal)
            btn.setTitleColor(UIColor.init(r: 242, g: 90, b: 65), for: .selected)
         
            
        }
        
    }
}
