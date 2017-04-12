//
//  XNTabBarController.swift
//  XNLovePlay_Swift
//
//  Created by xunan on 2017/4/12.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

class XNTabBarController: UITabBarController {
    
    override class func initialize() {
        var attrsSelected = [String: NSObject]()
        attrsSelected[NSForegroundColorAttributeName] = UIColor.red
        UITabBarItem.appearance().setTitleTextAttributes(attrsSelected, for: .selected)
        
        var attrsNromal = [String : NSObject]()
        attrsNromal[NSForegroundColorAttributeName] = UIColor.gray
        UITabBarItem.appearance().setTitleTextAttributes(attrsNromal, for: .normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildViewControllers()
    }

    func addChildViewControllers() {
        setupOneChildViewController("资讯", image: "icon_zx_nomal_pgall", selectedImage: "icon_zx_pressed_pgall", controller: XNNewsController.init())
        setupOneChildViewController("精选", image: "icon_jx_nomal_pgall", selectedImage: "icon_jx_pressed_pgall", controller: XNGreatestHitsController.init())
        setupOneChildViewController("社区", image: "icon_sq_nomal_pgall", selectedImage: "icon_sq_pressed_pgall", controller: XNCommunityController.init())
        setupOneChildViewController("我的", image: "icon_w_nomal_pgall", selectedImage: "icon_w_pressed_pgall", controller: XNMineController.init())
    }
    
    fileprivate func setupOneChildViewController(_ title: String,
                                                 image: String,
                                                 selectedImage: String,
                                                 controller: UIViewController) {
        controller.tabBarItem.title = title
        controller.title = title
        controller.tabBarItem.image = UIImage(named:image)?.withRenderingMode(.alwaysOriginal)
        controller.tabBarItem.selectedImage = UIImage(named:selectedImage)?.withRenderingMode(.alwaysOriginal)
        let nav = XNNavigationController.init(rootViewController: controller)
        addChildViewController(nav)

    }
}
