//
//  XNNewsCell_2.swift
//  XNLovePlay_Swift
//
//  Created by xunan on 2017/4/14.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

class XNNewsCell_2: UITableViewCell {

    fileprivate lazy var titleLabel:UILabel = {
        let titleLabel:UILabel = UILabel.init(frame: CGRect.init(x: 10, y: 5, width: KScreen_W - 20, height: 20))
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.textColor = UIColor.black
        return titleLabel
    }()
    
    fileprivate lazy var imgView:UIImageView = {
        let imgView = UIImageView.init(frame: CGRect.init(x: 10, y: 30, width: KScreen_W-20, height: 110))
        
        return imgView
    }()
    
    var newLineModel: XNNewsModel? {
        didSet {
            if (newLineModel?.imgsrc.count)!>0 {
                let url = URL(string: (newLineModel?.imgsrc[0])!)
                self.imgView.kf.setImage(with: url)
            }
            
            self.titleLabel.text = newLineModel?.title
        }
    }
    
    func loadUI() {
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.imgView)
        
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        loadUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
