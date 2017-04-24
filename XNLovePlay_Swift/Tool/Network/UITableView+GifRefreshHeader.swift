//
//  UITableView+GifRefreshHeader.swift
//  LovePlay_Swift
//
//  Created by zhiquan.xu on 16/12/1.
//  Copyright © 2016年 Gemall. All rights reserved.
//

import Foundation
import MJRefresh

extension UITableView{
    
    func gifHeader(refreshData:()->()) -> MJRefreshGifHeader{
        
        let imageArray:[Any] = [UIImage.init(named: "refresh1")!,
                                UIImage.init(named: "refresh2")!,
                                UIImage.init(named: "refresh3")!,
                                UIImage.init(named: "refresh4")!]
        
        let header = MJRefreshGifHeader.init(refreshingTarget: self, refreshingAction: #selector(loadData))
        header?.setImages(imageArray, for: .idle)
        header?.setImages(imageArray, for: .pulling)
        header?.setImages(imageArray, for: .refreshing)
        
        header?.lastUpdatedTimeLabel.isHidden = true
        header?.stateLabel.isHidden = true
        
        refreshData()
        
        return header!
    }
    
    @objc func loadData(){
        self.mj_header.endRefreshing()
    }
}
