//
//  CommonTool.swift
//  LovePlay_Swift
//
//  Created by zhiquan.xu on 16/11/29.
//  Copyright © 2016年 Gemall. All rights reserved.
//

import Foundation
import UIKit

class CommonTool: NSObject {
    class func getTextRectSize(text:String,font:UIFont,size:CGSize) -> CGFloat {
        let attributes = [NSFontAttributeName: font]
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        let height:CGFloat = text.boundingRect(with: size, options: option, attributes: attributes, context: nil).size.height
        return height
    }
}
