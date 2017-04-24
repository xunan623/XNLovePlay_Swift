//
//  XNNewsCell_1.swift
//  XNLovePlay_Swift
//
//  Created by xunan on 2017/4/14.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit
import Kingfisher

class XNNewsCell_1: UITableViewCell {
    
    fileprivate lazy var imgView: UIImageView = {
        let imgView = UIImageView.init(frame: CGRect.init(x: 10, y: 10, width: 100, height: 70))
        return imgView
    }()

    fileprivate lazy var titleLabel: UILabel = {
        let titleLabel: UILabel  = UILabel.init(frame: CGRect.init(x: self.imgView.right + 10, y: 10, width: kScreenW - self.imgView.right - 20, height: 50))
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.textColor = UIColor.black
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    
    fileprivate lazy var commonIcon: UIImageView = {
        let conmonIcon: UIImageView = UIImageView.init(frame: CGRect.init(x: self.titleLabel.left, y: self.imgView.bottom - 11, width: 11, height: 11))
        conmonIcon.image = UIImage.init(named: "common_chat_new")
        return conmonIcon
    }()
    
    fileprivate lazy var commonCountLabel: UILabel = {
        let commonCountLabel: UILabel = UILabel.init(frame: CGRect.init(x: self.commonIcon.right + 10, y: self.commonIcon.top, width: 150, height: self.commonIcon.height))
        commonCountLabel.font = UIFont.systemFont(ofSize: 11)
        commonCountLabel.textColor = UIColor.gray
        return commonCountLabel
    }()
    
    var newLineModel: XNNewsModel? {
        didSet {
            if (newLineModel?.imgsrc.count)!>0 {
                let url = URL(string: (newLineModel?.imgsrc[0])!)
                self.imgView.kf.setImage(with: url)
            }
            
            self.titleLabel.text = newLineModel?.title
            let height = CommonTool.getTextRectSize(text: (newLineModel?.title)!, font: self.titleLabel.font, size: CGSize.init(width: self.titleLabel.width, height: self.titleLabel.height))
            self.titleLabel.height = height
            
            self.commonCountLabel.text = newLineModel?.replyCount.stringValue
        }
    }
    
    func loadUI() {
        self.contentView.addSubview(self.imgView)
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.commonIcon)
        self.contentView.addSubview(self.commonCountLabel)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        loadUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
