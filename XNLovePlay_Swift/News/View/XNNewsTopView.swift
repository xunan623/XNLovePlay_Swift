//
//  XNNewsTopView.swift
//  XNLovePlay_Swift
//
//  Created by xunan on 2017/4/12.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

protocol XNNewsTopViewDelegete: class {
    func newTopViewWithTag(_ view: XNNewsTopView, tog: Int)
}

class XNNewsTopView: UIView {
    
    weak var delegate: XNNewsTopViewDelegete?

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
            btn.titleLabel?.textAlignment = .center
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            btn.tag = 10 + index
            btn.addTarget(self , action: #selector(btnClickAction(btn:)), for: .touchUpInside)
            self.addSubview(btn)
            if index == 0 {
                btn.isSelected = true
                self.currentSelectedBtn = btn
                self.currentSelectedBtn?.titleLabel?.font = UIFont.systemFont(ofSize: 18)
                
                self.selectBottomLine.frame = CGRect(x: 5, y: btn.bottom, width: btnW - 10, height: 2)
                self.selectBottomLine.backgroundColor = UIColor.init(r: 242, g: 90, b: 65)
                self.addSubview(self.selectBottomLine)
            }
        }
        
    }
}

extension XNNewsTopView {
    @objc fileprivate func btnClickAction(btn:UIButton){
        
        if btn == self.currentSelectedBtn  {
            return
        }
        self.currentSelectedBtn?.isSelected = false
        self.currentSelectedBtn?.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        self.currentSelectedBtn = btn
        self.currentSelectedBtn?.isSelected = true
        self.currentSelectedBtn?.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        
        UIView.animate(withDuration: 0.2, animations: {
            self.selectBottomLine.left = btn.left+5
        })

        if self.delegate != nil {
            self.delegate?.newTopViewWithTag(self, tog: btn.tag - 10)
        }
    }
    
    open func selectOnePage(pageIndex:Int) {
        self.currentSelectedBtn?.isSelected = false
        self.currentSelectedBtn?.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        
        let btn:UIButton = (self.viewWithTag(pageIndex+10) as! UIButton)
        
        self.currentSelectedBtn = btn
        self.currentSelectedBtn?.isSelected = true
        self.currentSelectedBtn?.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        
        UIView.animate(withDuration: 0.2, animations: {
            self.selectBottomLine.left = btn.left+5
        })
    }
}



















































