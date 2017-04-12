//
//  XNNewsController.swift
//  XNLovePlay_Swift
//
//  Created by xunan on 2017/4/12.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

class XNNewsController: XNBaseController {
    
    fileprivate lazy var topView: XNNewsTopView = { [weak self] in
        let titles = ["头条","网游","手游","主机","电竞","暴雪"]
        let titleFrame = CGRect(x: 0, y: 0, width: Int(kScreenW), height: kNavigationBarAndStatusBarH)
        let topView = XNNewsTopView(frame: titleFrame, titleArray: titles)
        return topView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(topView)
    }
}
