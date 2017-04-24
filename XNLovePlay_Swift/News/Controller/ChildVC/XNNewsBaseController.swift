//
//  XNNewsBaseController.swift
//  XNLovePlay_Swift
//
//  Created by xunan on 2017/4/14.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit
import MJRefresh

class XNNewsBaseController: XNBaseController {

    public var urlStr: NSString = NewsListURL
    public var paramsStr: NSString =  ""
    
    fileprivate lazy var newTableView: UITableView = {
        let frame = CGRect.init(x: 0, y: 0, width: kScreenW, height: kScreenH - kTabBarH - 64)
        let newTableView = UITableView.init(frame: frame, style: .plain)
        newTableView.dataSource = self
        newTableView.delegate = self
        
        newTableView.register(XNNewsCell_1.self, forCellReuseIdentifier: "XNNewsCell_1")
        newTableView.register(XNNewsCell_2.self, forCellReuseIdentifier: "XNNewsCell_2")
        
        return newTableView
    }()

    var page: Int = 0
    var listArray: [XNNewsModel] = [XNNewsModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        view.addSubview(self.newTableView)
        
        refreshFooter()
        refreshHeader()
        
        loadData()
    }
    
    func refreshHeader() {
        self.newTableView.mj_header = self.newTableView.gifHeader {
            loadFirstData()
        }
    }
    
    func refreshFooter() {
    
        self.newTableView.mj_footer = MJRefreshAutoNormalFooter.init(refreshingBlock: { 
            self.loadMoreData()
        })
    }
    
    func loadFirstData() {
        self.listArray.removeAll()
        self.page = 0
        loadData()
    }
    
    func loadMoreData() {
        self.page += 20
        loadData()
    }
    
    func endRefresh() {
        self.newTableView.mj_footer.endRefreshing()
        self.newTableView.mj_header.endRefreshing()
    }
    
    
    override func loadData() {
        let urlString = "\(baseURL)" + "/" + "\(urlStr)" + "\(paramsStr)" + "/" + "\(self.page)" + "/" + "20"
        
        XNNetworkTool.reqeust(type: .GET, urlString: urlString) { (result) in
            guard let resultDict = result as? [String : NSObject] else {
                return
            }
            guard let info = resultDict["info"] as? [NSObject] else {
                return
            }
            
            for dic in info{
                let model = XNNewsModel.init(dict: dic as! [String : NSObject])
                self.listArray.append(model)
            }
            print(self.listArray.count)
            self.newTableView.reloadData()
            self.endRefresh()
        }
    }
}

extension XNNewsBaseController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < self.listArray.count {
            let model:XNNewsModel = self.listArray[indexPath.row]
            if model.showType.isEqual(to: 5){
                let cell = tableView.dequeueReusableCell(withIdentifier: "XNNewsCell_1", for: indexPath) as! XNNewsCell_1
                cell.selectionStyle = .none
                cell.newLineModel = model
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "XNNewsCell_2", for: indexPath) as! XNNewsCell_2
                cell.selectionStyle = .none
                cell.newLineModel = model
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row < self.listArray.count {
            let model: XNNewsModel = self.listArray[indexPath.row]
            if model.showType.isEqual(to: 5) {
                return 90
            } else {
                return 150
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row < self.listArray.count {
            let model: XNNewsModel = self.listArray[indexPath.row]
            let detailVC = XNDetailController()
            detailVC.urlString = model.url
            detailVC.newsTitle = model.title
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}


































