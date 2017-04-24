//
//  Date+Extension.swift
//  DYTV_Swift
//
//  Created by zhiquan.xu on 16/11/24.
//  Copyright © 2016年 Gemall. All rights reserved.
//

import Foundation

extension Date{
    static func getCurrentTime() -> String{
        let nowDate = Date()
        
        let interval = Int(nowDate.timeIntervalSince1970)
        
        return "\(interval)"
    }
    
    
}
