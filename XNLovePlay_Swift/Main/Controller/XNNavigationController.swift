//
//  XNNavigationController.swift
//  XNLovePlay_Swift
//
//  Created by xunan on 2017/4/12.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

class XNNavigationController: UINavigationController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        UINavigationBar.appearance().tintColor = UIColor.white
        let textAttrs = [NSForegroundColorAttributeName:UIColor.white,NSFontAttributeName:UIFont.init(name: "Helvetica", size: 18)]
        UINavigationBar.appearance().titleTextAttributes = textAttrs
        UINavigationBar.appearance().barStyle = .black
        UINavigationBar.appearance().isTranslucent = false
        navigationBar.isHidden = true
        self.interactivePopGestureRecognizer?.delegate = self
    }
    
    // MARK: - 拦截push控制器
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count >= 1 {
            viewController.hidesBottomBarWhenPushed = true
            let leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "back2_pgnews"), style: .plain, target: self, action: #selector(backAction(item:)))
            viewController.navigationItem.leftBarButtonItem = leftBarButtonItem
        }
        super.pushViewController(viewController, animated: true)
        
    }

    @objc func backAction(item:UIBarButtonItem){
        self.popViewController(animated: true)
    }
}
