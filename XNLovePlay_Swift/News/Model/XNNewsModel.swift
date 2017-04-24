//
//  XNNewsModel.swift
//  XNLovePlay_Swift
//
//  Created by xunan on 2017/4/14.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

class XNNewsModel: XNBaseModel {
    
    var articleTags:String = ""
    var boardid:String = ""
    var digest:String = ""
    var docid:String = ""
    var fromTopicSource:Bool = false
    var gameName:String = ""
    var id:NSNumber = 0
    var imgsrc:[String] = [String]()
    var lmodify:String = ""
    var photosetId:String = ""
    var priority:NSNumber = 0
    var ptime:String = ""
    var readSeconds:NSNumber = 0
    var replyCount:NSNumber = 0
    var showType:NSNumber = 0
    var specialId:String = ""
    var source:String = ""
    var subtitle:String = ""
    var title:String = ""
    var topicName:String = ""
    var url:String = ""
    var userId:NSNumber = 0
    var userOrder:Bool = false
    
    init(dict:[String:NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    

}
