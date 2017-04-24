//
//  UIColor+imageColor.swift
//  LovePlay_Swift
//
//  Created by zhiquan.xu on 16/11/28.
//  Copyright © 2016年 Gemall. All rights reserved.
//

import Foundation
import UIKit

extension UIImage{
    static func imageWithColor(color:UIColor) -> UIImage{
        let rect = CGRect.init(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext();
        
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!
    }
}
