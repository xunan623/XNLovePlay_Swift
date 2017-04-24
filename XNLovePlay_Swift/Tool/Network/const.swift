//
//  const.swift
//  DYTV_Swift
//
//  Created by zhiquan.xu on 16/11/23.
//  Copyright © 2016年 Gemall. All rights reserved.
//

import UIKit

let KScreen_W = UIScreen.main.bounds.size.width
let KScreen_H = UIScreen.main.bounds.size.height


func RGB(R:CGFloat,G:CGFloat,B:CGFloat,A:CGFloat) -> UIColor {
    return UIColor.init(red: R/255.0, green: G/255.0, blue: B/255.0, alpha: A)
}



