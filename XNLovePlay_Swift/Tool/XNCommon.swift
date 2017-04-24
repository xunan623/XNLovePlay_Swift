//
//  XNCommon.swift
//  XNLovePlay_Swift
//
//  Created by xunan on 2017/4/12.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit
import Foundation

let baseURL: NSString = "http://i.play.163.com"
let NewsListURL: NSString = "user/article/list/"
let NewsDetailURL: NSString = "/news/appDetail/"

let HotGameCommentURL: NSString = "/news/v2/hottie/"
let NewGameCommentURL: NSString = "/news/v2/newtie/"

let NewsRecommendTopicURL: NSString = "/news/topicOrderSource/list"
let NewsRecommendImageInfosURL: NSString = "/news/config/config_focus_img/list/"

let HotGameZoneURL: NSString = "/news/discuz/forum_recommend_detail"
let ZoneDiscuzURL: NSString = "/news/discuz/discuz_model_v2/list/center"
let DiscuzDetailURL: NSString = "http://bbs.d.163.com/api/mobile/index.php"
let ZoneDiscuzImageURL: NSString = "/news/discuz/discuz_model/fid_img"

let kNavigationBarAndStatusBarH = 64.0
let kStatusBarH: CGFloat = 20
let kNavigationBarH: CGFloat = 44.0
let kTabBarH: CGFloat = 49
let kScreenW = UIScreen.main.bounds.size.width
let kScreenH = UIScreen.main.bounds.size.height
let BGCOLOR: UIColor = UIColor(gray: 244)

let common = XNCommon()

class XNCommon: NSObject {

}
